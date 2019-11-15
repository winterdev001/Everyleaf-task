class UsersController < ApplicationController
  before_action :set_user, only: [:show]
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
        if current_user.present? 
          redirect_to tasks_path   
        else 
          session[:user_id] = @user.id
        end      
    else
      render :new
    end
  end  
  
  def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.' 
        render :show
      else
        render :edit 
      end
  end

  def destroy
    if @user.id == current_user.id
      redirect_to admin_users_url, notice: "You can not delete a current/logged  in user"
      @admins = User.admins
    elsif @admins == 1
      redirect_to admin_users_url, notice: " One admin must remain."
    else
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully deleted.'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if current_user.present?
      params.require(:user).permit(:name, :email, :password, :role)
    else
      params.require(:user).permit(:name, :email, :password)
    end  
  end
end
