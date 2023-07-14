class TasksController < ApplicationController
before_action :set_task, only:%i[ show edit update destroy]

  def index
    @tasks = Task.all.order(created_at: :desc)
    @tasks = @tasks.closest if params[:deadline]
    @tasks = @tasks.reorder(importance: :asc) if params[:importance]
    @tasks = @tasks.search_by_title(params[:query]) if params[:query]
    @tasks = @tasks.search_by_priority(params[:priority]) if params[:priority] && params[:priority] != ""
    @tasks = @tasks.page(params[:page]).per(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task= Task.new(task_params)
		if params[:back]
      render :new
	  else
		  if @task.save
        flash[:notice] = "タスクの登録が完了しました！"
        redirect_to tasks_path
		  else
       render :new
		  end
    end
	end

  def show 
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "編集しました。"
      redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "削除しました。"
    redirect_to tasks_path
  end

  def confirm
    @task = Task.new(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :priority, :importance)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_confirmation
    @confirmation = Confirmation.find(params[:id])
  end
end
