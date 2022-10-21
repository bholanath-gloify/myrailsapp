class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

  end

  def create
    book = Book.new(book_param)

    # if book.save
    #   render json: {status: true, data: book, message: "Book created successfully"}
    # else
    #   render json: {status: false, message: "Book not created"}
    # end
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(book_param)

    # if @book.present?
    #   render json: {status: true, data: @book, message: "Book updated successfully"}
    # else
    #   render json: {status: false, message: "Book not updated"}
    # end
  end

  def destroy
    @book.destroy
    # if @book.destroy.present?
    #   render json: {status: true, message: "Book Deleted successfully"}
    # else
    #   render json: {status: false, message: "Book not deleted"}
    # end
  end

  private

  def book_param
    params.permit(:title, :published_at, :language)
  end
  
  def set_book
    @book = Book.find_by id: params[:id]
  end

end
