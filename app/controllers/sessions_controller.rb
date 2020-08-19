class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    # If the user exists AND the password entered is correct
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie.
      session[:user_id] = @user.id
      redirect_to '/'
    else 
      # Go back to the login page if user login doesn't work
      redirect_to '/login'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
