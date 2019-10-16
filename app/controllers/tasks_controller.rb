class TasksController < ApplicationController
  helper_method :sortable
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    #  if params[:q]
    #   # @tasks = Task.search(params[:search]).order("created_at DESC")
    #   @search = Task.search(params[:q])
    #   @tasks = @search.result
    #  else
    #   @tasks = Task.all.order('created_at DESC')
    #  end
    @search = Task.search(params[:q])
    @tasks = @search.result
    # @tasks = Task.all.order("created_at DESC")
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
    params.require(:task).permit(:task_name,:label_name, :start_date, :deadline, :status)    
  end  

end
