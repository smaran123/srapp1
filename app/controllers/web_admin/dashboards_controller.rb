class WebAdmin::DashboardsController < ApplicationController
   helper_method :sort_column, :sort_direction  
  def index
    @admins = Admin.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:page=>params[:page],:per_page=>10)
   end
  
  def destroy
    @web_admin = WebAdmin.find(params[:web_admin_id])
    @admin = Admin.find(params[:id])
    if @admin.destroy
      redirect_to web_admin_dashboards_path
    end
  end
  
  private
  

  def sort_column  
    Admin.column_names.include?(params[:sort]) ? params[:sort] : "name"  
  end  
  
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end 

end
