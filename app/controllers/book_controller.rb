class BookController < ApplicationController

  def index
    @books = Book.all.order("created_at ASC")
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @libraries = Library.all
    @authors = User.where(user_role: 1)
    if params[:book].present?
      @book = Book.new(title: params[:book][:title],published_at: params[:book][:published_at].to_date,language: params[:book][:language],library_id: params[:book][:library_id].to_i,user_id: params[:book][:user_id].to_i)
      if @book.save!
        book = @book
        UserMailer.author_notify(book).deliver
        redirect_to book_index_path
      else
        redirect_to new_book_path
      end
    end
     
  end

  def create
    user_id = current_user.id
    @user=User.find(user_id)

    @book = Book.new(title: params[:book][:title],published_at: params[:book][:published_at],language: params[:book][:language],library_id:[:book][:library_id],user_id: params[:book][:user_id])
    if @book.save!
      redirect_to book_index_path
    else
      redirect_to new_book_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    @libraries = Library.all
    @authors = User.where(user_role: 1)
    if params[:book].present?
      @book = @book.update(title: params[:book][:title],published_at: params[:book][:published_at].to_date,language: params[:book][:language],library_id: params[:book][:library_id].to_i,user_id: params[:book][:user_id].to_i)
      redirect_to book_index_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(title: params[:book][:title],published_at: params[:book][:published_at].to_date,language: params[:book][:language],library_id: params[:book][:library_id].to_i,user_id: params[:book][:user_id].to_i)
       redirect_to @book
    else
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_index_path
  end


  private
  def book_params
    params.permit(:title, :published_at, :language, :library_id, :user_id)
  end


end
