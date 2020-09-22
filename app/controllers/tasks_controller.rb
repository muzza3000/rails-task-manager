class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params['id'])
  end

  def new
  end

  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
