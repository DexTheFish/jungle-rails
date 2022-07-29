class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise user_params
    @user = User.new(user_params)
    @user.email.downcase!
    
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Failed to create account!"
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

