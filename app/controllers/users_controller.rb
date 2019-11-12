class UsersController < ApplicationController
  before_action :set_task, only: [:show]

  
  def show
    @user = User.all      
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to  tasks_path ,notice: "You have signed up successfully!"
    else
      # Redraw the input form.
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
