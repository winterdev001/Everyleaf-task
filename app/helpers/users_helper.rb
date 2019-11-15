module UsersHelper
    def noaccess
       if session[:user_id] == nil
    #     redirect_to new_admin_user_path        
    #    else
        flash[:alert] = "can't access this page unless logged out"
        redirect_to tasks_path
        false
       end
    end

    def choose_new_or_edit
        if action_name == 'edit' 
            admin_user_path
        else
            admin_users_path
        end
      end

      def admin_authorize
       unless current_user and current_user.role?
            redirect_to root_path, alert:"Only administrator can access this page."
        end
      end
end