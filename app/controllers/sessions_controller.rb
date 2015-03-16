class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(:email => params[:email])

		if @user && @user.authenticate(params[:password])
			login(@user)
			flash[:notice] = "Hello #{@user.name}"
			redirect_to root_path
		else
			flash.now[:notice] = "Failed to login"
			render :new
		end
	end

	def destroy
		reset_session
		redirect_to root_path
	end

end