module HomeHelper

	def note(msg)
		flash[:notice] = msg
	end

	def logged_in?
		if user_signed_in?

		else
			note "vous n'etes pas connecté"
			redirect_to login_path
		end
	end

end
