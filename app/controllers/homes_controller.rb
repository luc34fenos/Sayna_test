class HomesController < ApplicationController
  	before_action :logged_in?

  	def index
      @lien = Lien.all
      if Date.current == last_projet_day.tomorrow.tomorrow
        no_admin.each do |k, u|
          if u.noted == false
            if u.note1 + u.note2.to_i < 10
              u.joker = u.joker - 1
            end
            u.noted = true
            u.save!
          end
        end
        @hash = no_admin
      end
  	end

    def correction
      puts "××××××××××××××××××××××××××××#{no_admin.key(Student.find_by(user_id: current_user.id))}"
      if Date.current == last_projet_day.tomorrow
        if Correct.last.nil?
          user_hash = hash2(no_admin.length)
          l = Correct.new(list: user_hash.to_s)
          l.liste = Liste.last
          l.save
          no_admin.each do |k, u|
            u.update(note1: 0, note2: 0, correcteur1: 0, correcteur2: 0, noted1: false, noted2: false, noted: false)
          end
        else
          unless Correct.last.liste_id == Liste.last.id
            no_admin.each do |k, u|
              u.update(note1: 0, note2: 0, correcteur1: 0, correcteur2: 0, noted1: false, noted2: false, noted: false)
            end
            h = no_admin.length
            user_hash = hash2(h.to_i)

            l = Correct.new(list: user_hash.to_s)
            l.liste = Liste.last
            l.save
          else
            user_hash = eval(Correct.last.list)
          end
        end
        unless current_user.try(:admin?)
          @hash = user_hash[no_admin.key(Student.find_by(user_id: current_user.id))]
          (1..5).to_a.each do |c|
            @h = user_hash[c]
            @h.each do |d|
              e = no_admin[d]
              if e.correcteur1 == 0
                e.correcteur1 = c
              elsif e.correcteur1 != 0 && e.correcteur1 != c
                e.correcteur2 = c
              end
              e.save
            end
          end
        else
          @hash = user_hash
        end
      else
        redirect_to part_path, notice: "le jours du correction n'est pas aujourd'hui"
      end
    end

  	def project
      if current_user.try(:admin?)
    		unless (Date.current.to_s == last_projet_day.to_s)
    			projet_date
    		end
        redirect_to part_path, notice: "un projet doit etre rendu aujourd'hui"
      else
        redirect_to part_path, notice: "vous n'avez pas le droit de faire cette action"
      end
  	end

    def note_user
      @user_id = params[:id]
    end

    def noter
      note = params[:user].permit!.to_hash
      if params[:correcteur_id].to_i == current_user.id
        user_hash = eval(Correct.last.list)
        user_hash[no_admin.key(Student.find_by(user_id: current_user.id)).to_i].each do |t|
          a = no_admin[t]
          if no_admin[t].correcteur1.to_i == no_admin.key(Student.find_by(user_id: current_user.id)).to_i && params[:user_id].to_i == t
            a.note1 = note.length
            a.noted1 = true
            a.save!
          elsif no_admin[t].correcteur2.to_i == no_admin.key(Student.find_by(user_id: current_user.id)).to_i && params[:user_id].to_i == t
            a.note2 = note.length
            a.noted2 = true
            a.save!
          end
          a.save!
        end
        redirect_to correction_path(id: current_user.id), notice: "votre note a été bien pris en compte, Merci!!!"
      else
        flash.now[:notice] = "un petit bug, veuillez reessayer"
        render :note_user
      end
    end
  	
end
