class SessionsController < ApplicationController
  def new # login page
  end

  def create
    # Look up User in db, authenticate, and redirect
    user = User.authenticate_with_credentials(params[:login][:email], params[:login][:password])
    if user
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy #log out (destroy cookie)
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
