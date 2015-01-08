class Admin::StudentsController < ApplicationController

  def new
    #@admin = Admin.find(params[:admin_id])
    @user = User.new
  end

  def index
    @users = User.all
    # @batches = Batch.all
  end
  
  def create
    # @admin = Admin.find(params[:admin_id])
    @user = User.new(user_params)
    @user.password = 'ashok123'
    @user.password_confirmation = 'ashok123'
    @user.admin_id = current_admin.id
    if @user.save
      @user.send_reset_password_instructions
      redirect_to  admin_dashboards_path
    else
      flash[:error] = "Failed to Send Invitation"
      render "new"
    end
  end
  
  def destroy
    @admin = Admin.find(params[:admin_id])
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_students_path
    end
  end
  
  def assign_class
    @admin = Admin.find(params[:admin_id])
    @user = User.find(params[:id])
    @batch = Batch.find(params[:id])
    @user.admin_id = current_admin.id
    @assign_class = StudentsBatch.new
    @subject = Subject.find(params[:id])
    puts "**********************"
    puts @user.inspect
    puts @admin.inspect
    puts @batch.inspect
    puts @subject.inspect
    puts "*********"
  end
  
  def assign_teacherclass
    #      @user.admin_id = current_admin.id
    if params[:subject_ids]
      params[:subject_ids].compact.each do |ami|
        @batch = StudentsBatch.find_by_batch_id_and_subject_id(params[:batch_id],ami)
        if !@batch.present? and ami.present? 
          @subject= StudentsBatch.new(:batch_id => params[:batch_id],:subject_id => ami,:admin_id => params[:admin_id],:user_id => params[:id]) 
          @subject.save
          @subject.subject.update_attribute(:assign, "Assigned")
        end
      end
    end
    flash[:notice] = "Successfully assign Subject to User"
    redirect_to  admin_students_path
  end
  
  def assign_subject
    @subjects = Subject.where("batch_id = ?", params[:batch_id])
  end
  
  private
  def user_params
    params.require(:user).permit!
  end
end

 