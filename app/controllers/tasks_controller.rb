class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks, only: [:index]

  respond_to :json

  # GET /tasks
  def index
    if @tasks.empty?
      render json: { message: 'No tasks found.' }
    else
      respond_with @tasks
    end
  end

  # GET /tasks/1
  def show
    respond_with @task
  end

  # POST /tasks
  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PUT /tasks/1/edit
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_tasks
    @tasks = current_user.tasks
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title,:description, :category_id, :status).merge(user_id: current_user.id)
  end
end
