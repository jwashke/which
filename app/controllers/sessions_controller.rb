class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      user.token = request.env["omniauth.auth"].token
      user.save
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
