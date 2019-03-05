class LiensController < ApplicationController

    def new
      @lien = Lien.new
    end

    def create
      if date_valid?
        l = Lien.new(params.require(:lien).permit(:liengit))
        l.liste = Liste.last
        l.student = Student.find_by(user_id: current_user.id)
        l.save
        redirect_to part_path, notice: "votre lien est enregistré"
      else
        redirect_to part_path, notice: "le temps est déja écoulé pour le projet"
      end
    end

    def edit
      @lien = Lien.find(params[:id])
    end

    def update
      if date_valid?
        p = params.require(:lien).permit(:liengit)
        l = Lien.find(params[:id])
        l.update(liengit: p[:liengit])
        l.save
        redirect_to part_path, notice: "votre lien est a jours"
      else
        redirect_to part_path, notice: "le temps est déja écoulé pour le projet"
      end
    end

    def destroy
      @lien = Lien.find(params[:id])
      @lien.destroy
      redirect_to part_path, notice: "le lien est effacé"
    end

end
