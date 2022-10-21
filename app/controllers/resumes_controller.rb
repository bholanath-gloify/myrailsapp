class ResumesController < ApplicationController
  def index
    @resumes = Resume.all.order("created_at ASC")   
  end

  def new
    @resume = Resume.new   
  end

  def create
    if params[:resume].present?
      @resume = Resume.new(name: params[:resume][:name], attachment: params[:resume][:attachment])   
         
      if @resume.save! 
         redirect_to resumes_path, notice: "Successfully uploaded."   
      else   
         render "new"   
      end
    end
  end

  def show
    @resume = Resume.find_by(id: params[:id])
  end

  def destroy
    @resume = Resume.find(params[:id])   
      @resume.destroy   
      redirect_to resumes_path, notice:  "Successfully deleted."   
  end

   private   
    def resume_params   
      params.require(:resume).permit(:name, :attachment)   
    end   

end
