class UsersController < ApplicationController
	def new

	end	
	def create
		user = User.create(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/secrets'
		else
		flash[:errors] = user.errors.full_messages
		redirect_to :back
		end	
	end	


	private
		def user_params
			params.require(:register).permit(:name,:email,:password,:password_confirmation)
		end	
end
