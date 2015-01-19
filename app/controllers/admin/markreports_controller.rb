class Admin::MarkreportsController < ApplicationController
  def new
    #@school_name = Admin.find(params[:school_name])
  #  @admin_id = params[:admin_id]
    #@batch_id = params[:batch_id]
  #  @user_id = params[:user_id]
    #@subject_id = params[:subject_id]
  #  @user_id = params[:user_id]
    @mark_report = MarkReport.new
  end

  def create
   # @school_name = Admin.find(params[:school_name])
    @mark_report = MarkReport.new(mark_report_params)
   # @mark.admin_id = @school_name.id
   # @mark.batch_id = params[:batch_id]
   # @mark.user_id = params[:user_id]
    #@mark.subject_id = params[:subject_id]
   # @mark.receiver_id = params[:receiver_id]
    if  @mark_report.save
      flash[:notice] = "Creating Mark List Successfully"
      redirect_to admin_markreports_path
    else
      flash[:notice] = "Failed to Creating Mark List"
      render :new
    end
  end
  
  def index
    @marks_reports = MarkReport.all
  end
  
  def edit
     @mark_report = MarkReport.find(params[:id])    
  end
  
  def update
     @mark_report = MarkReport.find(params[:id])    
    if  @mark_report.update_attributes(mark_report_params)
      redirect_to admin_markreports_path
    end
  end
  
  def destroy
    @mark_report = MarkReport.find(params[:id])    
    if  @mark_report.destroy
      redirect_to admin_markreports_path
    end
  end
  
  def student_subject_marks
    @subject_name = Subject.find(params[:subject_id])
    @marks_reports = Markreport.where("subject_id = #{params[:subject_id]} and receiver_id = #{current_user.id}")
  end
  
  private

  def mark_report_params
  	params.require(:mark_report).permit!
  end
end



