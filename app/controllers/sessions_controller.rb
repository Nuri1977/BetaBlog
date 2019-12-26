class SessionsController < ApplicationController

  def def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "yoo have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Wrong email or password, please try again."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end