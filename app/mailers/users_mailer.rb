class UsersMailer < ApplicationMailer

	def contact(user)
		@user = user
		mail(to: "fenos_28@sayna.io", subject: "message et question")
	end

end
