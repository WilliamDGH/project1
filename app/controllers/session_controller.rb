class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      session[:user_id] = user.id
      redirect_to root_path, :notice => 'Signed in sucessfully'
    else
      redirect_to login_path, :alert => 'Invaild email address or password'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_path, :notice => 'Signed out sucessfully'
  end
end
