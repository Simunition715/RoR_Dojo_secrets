class SecretsController < ApplicationController
	def index
		@secrets = Secret.where.not(like: 0)
		@likes = Secret.where(like:0)
	end	

	def create
		secret = Secret.create(secret:params[:secret], user:User.find(current_user.id),like:0)
		if secret.save
			redirect_to :back
		else
			p User.find(current_user.id)
			flash[:errors] = "Your secret is too creepy to post!"
			redirect_to :back
		end	
		
	end	
	def destroy
		Secret.find(params[:id]).destroy
		redirect_to '/secrets'
	end	
	def like
		secret = Secret.find(params[:id]).increment!(:like)
		redirect_to '/secrets'

	end	


	private
end
