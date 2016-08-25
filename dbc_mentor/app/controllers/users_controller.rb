class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@user = User.find(session[:id])
	end

	def create
		
		password = params[:user][:password]
		password_confirm = params[:user][:password_confirmation]
		if password != password_confirm
			flash.now[:alert] = "Passwords Do Not Match"
			@user = User.new
			return render "new" 
		else
			if params[:type] == "Mentor"
				if params[:mentor_code] != "12345"
					@user = User.new
					flash.now[:alert] = "Mentor Code Is Not Valid.  Try Again"
					return render "new"
				end
			end
			@user = User.create!(name: params[:user][:name], email: params[:user][:email], password: password, phone: params[:user][:phone], type: params[:type], topics: params[:user][:topics])
			session[:id] = @user.id
			flash[:notice] = "Registration Successful!  Thank You For Joining"
			redirect_to users_path
		end
	end



end