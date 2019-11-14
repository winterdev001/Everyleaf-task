module UsersHelper
    def noaccess
       if session[:user_id] != nil
        flash[:alert] = "can't access this page unless logged out"
        redirect_to tasks_path
        false
    #    else
    #     redirect_to new_user_path
       end
    end
end