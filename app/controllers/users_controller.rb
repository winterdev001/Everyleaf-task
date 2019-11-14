class UsersController < ApplicationController
  before_action :set_task, only: [:show]
  before_action :noaccess,only: [:new]
  
  def show
    @user = User.all      
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save      
        session[:user_id] = @user.id
        redirect_to tasks_path      
    else
      render :new
    end
  end    

  private
  def set_task
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end
end
