# SessionsController manages user sessions for login and logout processes
class SessionsController < ApplicationController
  # Renders the login form.
  def new
  end

  # Creates a new user session
  def create
    # Find a user by the email provided.
    user = User.find_by(email: params[:email])
    
    # Check if the user exists, if the password is correct, and if the user is active
    if user && user.authenticate(params[:password]) && user.status == "Active"
      # Store user details in the session.
      session[:user_id] = user.id
      session[:fname] = user.fname
      session[:is_admin] = user.is_admin

      # Redirect admin users to the admin dashboard and other users to their home
      if session[:is_admin]
        redirect_to admin_path, notice: "Logged in successfully!"
      else
        redirect_to userhome_path, notice: "Logged in successfully!"
      end
    else
      # Handle various reasons for login failure

      # User account is suspended
      if user.status == "Suspended"
        flash.now[:error] = "Your account is currently suspended."
        render 'new'
      # User account is banned
      elsif user.status == "Banned"
        flash.now[:error] = "Your account is banned."
        render 'new'
      # Invalid login credentials
      else
        flash.now[:error] = "Invalid email or password. Please try again."
        render 'new'
      end
    end
  end

  # Ends the user session (logs out the user)
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
