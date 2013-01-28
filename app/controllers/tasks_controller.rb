class TasksController < ApplicationController
  
  def create
  	p params
    @task = Task.new(name: params[:name], project_id: params[:project_id])
    if @task.save 
      render :partial => "layouts/task"
    else
      render :text => ""
    end 
  end

  def update
  end

  def delete
  end

  def set_priority
  end

  def set_deadline
  end

end