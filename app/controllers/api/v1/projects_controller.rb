class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, except: [:index, :create]

  
  def index
    projects = current_user.projects
  	if projects.present?
  		render_collection(projects, 'projects', Project , "Projects found successfully")
  	else
  	  render_error("Unable to find Project")
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
      render json: {success: true, project: @project, message: "Project Successfully updated"}
    else
      render json: {success: false, message:"somthing went wrong"}
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