class TasksController < ApplicationController
  before_action :authenticate
  # before_action :authenticate, only: [:show, :edit, :update, :destroy]

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @search = Task.search(params[:q])
    if params[:q]
    # @tasks = Task.search(params[:search]).order("created_at DESC")
      @tasks = @search.result.page(params[:page]) 
      @tasks = Task.all.order("created_at DESC").page(params[:page])
    elsif params[:sort_with_created_at]
      @tasks = Task.order('created_at DESC').page(params[:page]) 
      @tasks = Task.all.order("created_at DESC").page(params[:page])
    elsif params[:sort_with_deadline]
      @tasks = Task.order('deadline ASC').page(params[:page]) 
      @tasks = Task.all.order("deadline ASC").page(params[:page])
    elsif params[:sort_with_priority]
      @tasks = Task.order('priority ASC').page(params[:page]) 
      @tasks = Task.order('priority ASC').page(params[:page])
    else
      @tasks = Task.all.order("created_at DESC").page(params[:page])
    end
    # @search = Task.search(params[:q])
    # @tasks = @search.result
    # @tasks = Task.all.order("created_at DESC").page(params[:page]) 
    # @tasks = Task.order('created_at DESC').where(status:"not started").or(Task.order('created_at DESC').where(status: "on going")).page(params[:page])
    # @finished = Task.where(status: "finished").order('created_at DESC')
    # @progress = Task.where(status:"not started").or(Task.where(status: "on going")).size
  end

  def sorted
    @task = Task.all.order("deadline ASC")
  end

  def new 
    @task = Task.new
  end

  def show
    @tasks = Task.all
  end

  def edit
  end

  def create    
    @task = Task.new(task_params)  
    @task = current_user.tasks.build(task_params)
    @user = current_user
    if @task.save
      redirect_to root_path, notice: 'Task was successfully created.' 
    else
      render :new 
    end     
  end 
  
  def update    
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task was successfully updated.' 
    else
      render :edit      
    end   
  end
 
  def destroy
    @task.destroy    
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'  
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name,:label_name, :start_date, :deadline, :status, :priority)    
  end  

end
