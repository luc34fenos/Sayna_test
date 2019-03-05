class HomeController < ApplicationController
	  before_action :user_signed_in?, only: [:lovers, :program]

    def send_mail
        user = params[:user]
        if UsersMailer.contact(user).deliver_now
          note "message envoyé"
          redirect_to root_path
        else
          note "donné invalid, veuillez reéssayer"
          render "contact"
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def users_all
        @user = User.all
    end

  	def index

  	end

  	def works

  	end

  	def lovers

  	end

  	def contact

  	end

  	def program

  	end

end
