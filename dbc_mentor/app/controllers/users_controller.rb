class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@user = User.find(session[:id])
	end

	def create
    # binding.pry
		password = params[:user][:password]
		password_confirm = params[:user][:password_confirmation]
		if password != password_confirm
			flash.now[:alert_password] = "Passwords Do Not Match"
			@user = User.new
			return render "new"
		else
			if params[:type] == "Mentor"
				if params[:mentor_code] != "12345"
					@user = User.new
					flash.now[:alert_mentor] = "Mentor Code Is Not Valid.  Try Again"
					return render "new"
				end
			end
			@user = User.create!(name: params[:user][:name], email: params[:user][:email], password: password, phone: params[:user][:phone], type: params[:user][:type], topics: params[:user][:topics])
      session[:id] = @user.id
			flash[:notice] = "User was successfully created."
			redirect_to root_path
		end
	end

end

