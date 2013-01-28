class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
	end

  def create
  	@project = Project.new(name: params[:name], user_id: session[:user_id])
    if @project.save 
      render :partial => "project"
    else
      render :text => ""
    end 
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