class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to show_appointments_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to show_appointments_path, :notice => "Logged out!"
  end
end
