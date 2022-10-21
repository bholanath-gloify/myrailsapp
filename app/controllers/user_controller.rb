class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_user, only:[:show, :destroy, :edit]

  def index
    @user = User.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def new
    if params[:user].present?
     @user = User.new(email: params[:user][:email], password: params[:user][:password], name: params[:user][:name], dob: params[:user][:dob].to_date)
     if @user.save!
      user = @user
       #UserMailer.with(user: @user).welcome_email.deliver_later
       UserMailer.welcome_email(user).deliver

      redirect_to(@user)
       #format.json { render json: @user, status: :created, location: @user}
       
      #redirect_to user_index_path
     else
      render action: 'new'
      #format.json { render json: @user.error, status: unprocessable_entity}
      #redirect_to user_create_path
     end
    end
  end

  def create
    if params[:user].present?
      #byebug
      @user = User.create(email: params[:user][:email], password: params[:user][:password], name: params[:user][:name], dob: params[:user][:dob].to_date)
      if @user.save!
        redirect_to user_index_path
      else
        redirect_to user_create_path
      end
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if params[:user].present?
      @user.update(email: params[:user][:email], password: params[:user][:password], name: params[:user][:name], dob: params[:user][:dob].to_date)
      
      user = @user
      UserMailer.update_user(user).deliver
      redirect_to(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    user = @user
     UserMailer.delete_user(user).deliver
    redirect_to user_index_path
  end

  def user_params
    params.permit(:email, :encrypted_password, :user_role, :name, :dob)
  end
  
  def set_user
    @user = User.find_by id: params[:id]
  end
end
