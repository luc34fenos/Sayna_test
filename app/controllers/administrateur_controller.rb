class AdministrateurController < ApplicationController
	before_action:admin

	def admin
		if current_user.try(:admin?)

		else
			redirect_to root_path
		end
	end
	
  	def index
  		@user = User.all
  	end
  	
end
