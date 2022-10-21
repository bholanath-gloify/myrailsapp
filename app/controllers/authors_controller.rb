class AuthorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_author, only:[:show, :destroy, :update]

  def index
    @authors = User.all.order("created_at ASC")
    # if author.present?
    #   render json: {status: true, data: author, message: "All Author data found"}
    # else
    #   render json: {status: false, message: "No data found"}
    # end
  end

  def show
    @author = Author.find_by(id: params[:id])
      # if author
      #   render json: {status: true, data: author, message: "Author data found"}
      # else
      #   render json: {status: false, message: "No data found"}
      # end
  end

  def create
    @author = Author.create(author_param)
    # if author
    #   render json: {status: true, data: author, message: "Author created successfully"}
    # else
    #   render json: {status: false, message: "Author not created"}
    # end
  end

  def update
    @author = Author.find_by(id: params[:id])
    @author.update(author_param)
    # if @author.present?
    #   render json: {status: true, data: @author, message: "Author updated successfully"}
    # else
    #   render json: {status: false, message: "Author not updated"}
    # end
  end

  def destroy
    @author.destroy

    # if @author.destroy.present?
    #   render json: {status: true, message: "Author Deleted successfully"}
    # else
    #   render json: {status: true, message: "Author not deleted"}
    # end
  end

  def author_param
    params.permit(:name, :dob)
  end
  
  def set_author
    @author = Author.find_by id: params[:id]
  end

end
