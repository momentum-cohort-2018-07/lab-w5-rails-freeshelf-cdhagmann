class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_url 
    else
      flash[:error_message] = "Invalid username and/or password."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to books_url, notice:  "You've been logged out"
  end

end