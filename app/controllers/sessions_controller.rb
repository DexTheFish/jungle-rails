class SessionsController < ApplicationController
  def new # login page
  end

  def create
    # Look up User in db
    user = User.find_by(email: params[:login][:email].downcase)
    # Authenticate and redirect
    if user && user.authenticate(params[:login][:password]) 
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
