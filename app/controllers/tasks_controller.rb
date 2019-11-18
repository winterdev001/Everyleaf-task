class TasksController < ApplicationController
  before_action :authenticate
  # before_action :authenticate, only: [:show, :edit, :update, :destroy]

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def search
    @task =task.search(params[:search])
  end

  def index
    @search = Task.search(params[:q])    
    @tasks = if params[:search]
      Task.where('status LIKE ? or task_name LIKE ?', "%#{params[:search]}%","%#{params[:search]}%").page params[:page]
      elsif params[:search1]
        Task.where('task_name LIKE ?', "%#{params[:search1]}%").page params[:page]
      elsif params[:search2]
        Task.where('status LIKE ?', "%#{params[:search2]}%").page params[:page]
      elsif params[:search3]
        Task.joins(:labels).where('labels.name ILIKE ?', "%#{params[:search3]}%").page params[:page]
      else
        #@tasks = Task.all.order('created_at desc').page params[:page]
        @tasks = Task.order_list(params[:sort_by]).page params[:page]
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
    params.require(:task).permit(:task_name,:label_name, :start_date, :deadline, :status, :priority, :search, :search1, :search2, :search3, :labels, label_ids:[])    
  end  

end
