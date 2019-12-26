class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :show, :destriy]
  before_action :correct_user, only: [:destroy]
  
  def index
    if logged_in?
    @tasks = current_user.tasks.all
    count(@task)
    end
  end

  def new
    if logged_in?
    @task = Task.new
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = '作成しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '作成できませんでした。'
      render :new
    end
  end

  def show
  end

  def destroy
    @task.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def task_params
    params.require(:task).permit(:title, :amount, :start_time, :content)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
    redirect_to root_url
    end
  end
end
