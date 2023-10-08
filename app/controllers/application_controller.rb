class ApplicationController < ActionController::Base
    # Define helper methods so they can be used in views
    helper_method :current_user, :logged_in?, :is_administrator?
  
    # Returns the current logged-in user based on the session's user_id
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    # Checks if a user is logged in by seeing if current_user exists
    def logged_in?
      !current_user.nil?
    end
  
    # Checks if the current logged-in user is an administrator
    def is_administrator?
      session[:is_admin]
    end
  
    private
  
    # Ensures a user is logged in before allowing certain actions.
    # If not logged in, it redirects the user to the login page.
    def require_login
      unless logged_in?
        flash[:error] = "You are not permitted to access this resource"
        redirect_to login_path
      end
    end
  end
  