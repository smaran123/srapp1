class Admin::BatchesController < ApplicationController
  def new
    #  @admin = Admin.find(params[:admin_id])
    @batch = Batch.new
    #    1.times {@batch.subjects.build}
    if @batch.subjects.blank?
      @batch.subjects.build
    end
  end
  
  def index
    @batches = Batch.all
    
  end
  
  def create
    #  @admin = Admin.find(params[:admin_id])
    @batch = Batch.new(batch_params)
    @batch.admin_id = current_admin.id
    if @batch.save
      flash[:notice] = "class is created"
      redirect_to admin_batches_path
    else
      flash[:error] = "Failed to Send Invitation"
      render :action => 'new'
    end
  end
  

  private
  
  def batch_params
    params.require(:batch).permit!
  end
  
end
