class TasksController < ApplicationController
  
  def create
    @task = Task.new(name: params[:name], project_id: params[:project_id])
    if @task.has_unique_name_in_project?(params[:name]) && @task.save 
      render :partial => "layouts/task"
    else
      render :text => ""
    end 
  end

  def update
  end

  def destroy
    @task = Task.find(params[:task_id])
    @task.destroy
  end

  def set_priority
    @task = Task.find(params[:task_id])
    @task.priority_id = params[:priority_id]
    @task.save
  end

  def set_deadline
    p params
    @task = Task.find(params[:task_id])
    @task.deadline = params[:date]
    if @task.save
      render text: ""
    else
      render text: "Error"
    end
  end

  def mark_as_done
  end

end