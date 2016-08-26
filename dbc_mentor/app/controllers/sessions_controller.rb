class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      end 
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
