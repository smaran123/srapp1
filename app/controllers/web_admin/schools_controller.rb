class WebAdmin::SchoolsController < ApplicationController

	def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.password = 'ashok123'
    @admin.password_confirmation = 'ashok123'
    @admin.web_admin_id = current_web_admin.id
    if @admin.save
      @admin.send_reset_password_instructions
      redirect_to web_admin_dashboards_path
    else
      render "new"
    end
  end
  
  private
    
  def admin_params
    params.require(:admin).permit!
  end

end
