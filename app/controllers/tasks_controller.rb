class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = finder
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = finder
  end

  def update
    @task = finder
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = finder
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def finder
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
