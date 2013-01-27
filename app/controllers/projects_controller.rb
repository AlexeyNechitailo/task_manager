class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
	end

  def create
  	project = Project.new
  end
  
  def update
  	project = Project.find(params[:project_id])
  end
  
  def delete
  	project = Project.find(params[:project_id])
  	project.destroy
  end

  def check_authorization
    redirect_to root_path if current_user.guest?
  end

end