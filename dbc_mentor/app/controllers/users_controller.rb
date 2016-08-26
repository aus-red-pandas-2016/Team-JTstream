class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
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
			@user = User.create!(name: params[:user][:name], email: params[:user][:email], password: password, phone: params[:user][:phone], type: params[:type], topics: params[:user][:topics])
      session[:id] = @user.id
			flash[:notice] = "User was successfully created."
			redirect_to show_appointments_path
		end
	end

	def show
		@user = User.find(session[:id])
	end

	def edit
		@user = User.find(session[:id])
	end

	def update
		@user = User.find(session[:id])
		user_type = params.keys[3]
		if @user.update_attributes(params.require(user_type).permit(:topics, :phone, :email))
			flash[:notice] = "Information updated successfully"
			redirect_to user_path(session[:id])
		else
			flash.now[:alert] = "Information did not update. Please try again"
			render "edit"
		end
	end

end

