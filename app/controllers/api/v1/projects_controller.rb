class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:update, :show]

  def index
    projects = current_user.projects.page(params[:page]).per(params[:items_per_page])
  	if projects.present?
  		render_collection(projects, 'projects', Project , "Projects found successfully")
  	else
  	  render_collection(projects, 'projects', Project , "Projects is empty")
  	end
  end
  
  def create
    project = current_user.projects.build(project_params)
    if project.save
    	render_object(project,'project',"Project Successfully created")
    else
    	render_error("Unable to create Project")
    end
  end
  
  def update
    if @project.present? && @project.update(project_params)
      render_object(project,'project',"Project Successfully updated")
    else
      render_error("somthing went wrong")
    end
  end

  def show
    added_products = @project.products.page(params[:page]).per(params[:items_per_page])
    if added_products.present?
      render_collection(added_products, 'product', Product , "Products found successfully")
    else
      render_collection(added_products, 'product', Product , "#{@project.project_name} product is empty")
    end  
  end

  def delete_all_added_products
    project = Project.find(params[:project_id])
    if project.present? && project.products.destroy_all
      render_destroy("Successfully deleted all products")
    else
      render_error("somthing went wrong")
    end  
  end
  
  private
  
  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
   params.require(:project).permit(:project_name)
  end

end