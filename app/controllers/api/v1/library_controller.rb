class Api::V1::LibraryController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_library, only:[:show,:destroy,:update]

  def index
    library = Library.all
    if library.present?
      render json: {status: true, data: library, message: "All library data found"}
    else
      render json: {status:false, message: "No data found"}
    end
  end

  def show
    #render json: @library, status: 200
    library = Library.find_by(id: params[:id])
    if library
      render json: {status: true, data: library, message: "Library data found"}
    else
      render json: {message: "No data found"}
    end
  end

  def create
    library = Library.new(library_param)

    if library.save
      render json: {status: true, data: library, message: "library created successfully"}

    else
        render json: {status: false, message: "library not created"}
    end

  end

  def update

    @library = Library.find_by(id: params[:id])
    @library.update(library_param)

    if @library.present?
      render json: {status: true, data:@library, message: "Library update successfully"}
    else
      render json: {status: false, message: "Library not updated"}
    end
  end

  def destroy
    # @library = Library.find(params[:id])
    @library.destroy

    if @library.destroy.present?
      render json: {status: true, message: "Library deleted successfully"}
    else
      render json: {status: false, message: "Library not deleted"}
    end
  end

  private

  def library_param
    params.permit(:name,:opening_time,:closing_time)
  end

  def set_library
    @library = Library.find_by id: params[:id]
  end

end
