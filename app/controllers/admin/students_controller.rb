class Admin::StudentsController < ApplicationController

  def new
   #@admin = Admin.find(params[:admin_id])
    @user = User.new
  end

  def create
    @admin = Admin.find(params[:admin_id])
    @user = User.new(user_params)
    @user.password = 'ashok123'
    @user.password_confirmation = 'ashok123'
    if @user.save
          @user.send_reset_password_instructions

      redirect_to  admin_dashboards_path
    else
      flash[:error] = "Failed to Send Invitation"
      render "new"
    end
  end
  

  private
  
  def user_params
    params.require(:user).permit!
  end
end