class ApplicationController < ActionController::Base

	include HomesHelper
	include HomeHelper

	before_action :configure_devise_parameters, if: :devise_controller?

	def configure_devise_parameters
		devise_parameter_sanitizer.permit(:sign_up){|x| x.permit(:username, :email, :password, :password_confirmation)}
	end
	
end
