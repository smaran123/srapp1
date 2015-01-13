class Admin::StudentsController < ApplicationController

  def new
    #@admin = Admin.find(params[:admin_id])
    @user = User.new
  end

  def index
    @users = User.all
    # @batches = Batch.all
     @assign_class = StudentsBatch.new
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
  #  @admin = Admin.find(params[:admin_id])
    @user = User.find(params[:id])
    @user.admin_id = current_admin.id
    @assign_class = StudentsBatch.new
       render :layout => false
  end
  
  def assign_teacherclass
    @user = User.find(params[:id])
    @admin = Admin.find(params[:admin_id])
    @user.admin_id = @admin.id
    if params[:subject_ids]
      params[:subject_ids].compact.each do |ami|
        @assign_class = StudentsBatch.find_by_batch_id_and_subject_id(params[:batch_id],ami)
        if !@assign_class.present? and ami.present? 
          @assign_class= StudentsBatch.new(:batch_id => params[:batch_id],:subject_id => ami,:admin_id => params[:admin_id],:user_id => params[:id]) 
          @assign_class.save
          @assign_class.subject.update_attribute(:assign, "Assigned")
        end
      end
    end
    flash[:notice] = "Successfully assign Subject to User"
  end
  
  
  def assign_subject
    #  @subjects = Subject.where("assign is null and batch_id = ?", params[:student_id])
    @subjects = Subject.where("assign is null and batch_id = ?", params[:student_id])
  end
  
  private
 
  def user_params
    params.require(:user).permit!
  end
  
end

