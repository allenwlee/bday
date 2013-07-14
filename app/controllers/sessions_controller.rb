class SessionsController < ApplicationController

  def create
    if auth
      p auth
      provider_user = User.from_omniauth(auth)
      session[:user_id] = provider_user.id
      redirect_to calendars_path
    else
      flash[:errors_login] = ['The Google authorization process failed.  Please try again.']
      redirect_to root_path
    end
  end


  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
  
end