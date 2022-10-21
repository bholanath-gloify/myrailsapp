class LibraryController < ApplicationController

    skip_before_action :verify_authenticity_token
  
    before_action :set_library, only:[:show,:destroy,:update]
  
    def index
      @library = Library.all.order("created_at ASC")
      respond_to do |format|
        format.html
        format.xlsx
      end
    end
  
    def show
      @library = Library.find_by(id: params[:id])
      @books = @library.books
    end
  
    def create
      if params[:library].present?

        @library = Library.new(name: params[:library][:name],opening_time: params[:library][:opening_time],closing_time: params[:library][:closing_time])  
        if @library.save!
          redirect_to library_index_path
        else
          render.new
        end
      end
    end

    def new
      if params[:library].present?

        @library = Library.new(name: params[:library][:name],opening_time: params[:library][:opening_time],closing_time: params[:library][:closing_time])  
        if @library.save!
          redirect_to library_index_path
        else
          render.new
        end
      end
    end
  
    def update 
      @library = Library.find_by(id: params[:id])
      @library.update(library_param)
    end

    def edit 
      @library = Library.find_by(id: params[:id])
      if params[:library].present?
        @library = @library.update(name: params[:library][:name],opening_time: params[:library][:opening_time],closing_time: params[:library][:closing_time])
        redirect_to library_index_path
      end
    end
  
    def destroy
      @library = Library.find(params[:id])
      @library.destroy
      redirect_to library_index_path
    end
  
    private
  
    def library_param
      params.permit(:name,:opening_time,:closing_time)
    end
  
    def set_library
      @library = Library.find_by id: params[:id]
    end
  
  end
  