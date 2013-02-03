class TasksController < ApplicationController
  
  def create
    @task = Task.new(name: params[:name], project_id: params[:project_id])
    @priorities = Priority.all
    if @task.has_unique_name_in_project?(params[:name]) && @task.save 
      render :partial => "layouts/task"
    else
      render :text => ""
    end 
  end

  def update
    # @task = Task.find(params[:task_id])
    # if @task.update_attributes(params[:task])
    #   render text: ""
    # else
    #   render text: "Error"
    # end
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
    @task = Task.find(params[:task_id])
    if @task.update_attributes(params[:task])
      render text: ""
    else
      render text: "Error"
    end
  end

  def mark_as_done
    @task = Task.find(params[:task_id])
    if @task.update_attributes(params[:task])
      render text: ""
    else
      render text: "Error"
    end
  end

end