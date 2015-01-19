class Admin::AttendancesController < ApplicationController
  def new
     @attendence = Attendance.new
   # render :layout => false
  end
  
  def create
    @attendence = Attendance.new(attendance_params) 
    @attendence.admin_id = current_admin.id
        if @attendence.save
      flash[:notice] = "Giving Attendance Successfully"
      redirect_to admin_attendances_path
    else
      flash[:notice] = "Attendance Given Failure"
      render :new
    end
  end
  
  def index
   @users = User.all
    @attendence_reports = Attendance.where("user_id = #{params[:user_id]}")
  end

  private

  def attendance_params
  	params.require(:attendance).permit!
  end
end




