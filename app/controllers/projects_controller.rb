class ProjectsController < ApplicationController

  before_filter :check_authorization, only: :index
	
  def index
		@projects = current_user.projects
    @priorities = Priority.all
	end

  def create
  	@project = Project.new(name: params[:name], user_id: session[:user_id])
    if @project.has_unique_name?(params[:name]) && @project.save 
      render :partial => "project"
    else
      render :text => ""
    end 
  end
  
  def update
  	@project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      @message = "successfully updated"
    else
      @message = "errors"
    end
  end
  
  def destroy
  	@project = Project.find(params[:id])
    @project.tasks.each{ |task| task.destroy }
  	@project.destroy
  end

end