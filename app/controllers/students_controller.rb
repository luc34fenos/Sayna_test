class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end

  def create
    param = params.require(:student).permit(:firstname, :lastname, :datenais, :ville)
    s = Student.new(param)
    s.user_id = current_user.id
    s.age = (Date.current - param[:datenais].to_date) / 365
    puts "÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷#{s.age}"
    s.email = current_user.email
    if s.valid?
      s.save
      redirect_to part_path, notice: "votre compte etudiant a été creer"
    else
      s.errors.full_messages.each do |error|
        note error
      end
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    param = params.require(:student).permit(:firstname, :lastname, :datenais, :ville)
    s = Student.find_by(params[:id])
    s.update(param)
    if s.valid?
      s.save
      redirect_to part_path, notice: "votre compte etudiant a mis à jour"
    else
      render "edit"
    end
  end

  def destroy
    s = Student.find_by(id: params[:id])
    if s
      s.destroy
      redirect_to part_path, notice: "votre compte a été suprimé avec succes"
    else
      redirect_to edit_student_path, "Il y a un bug, veuillez recommencer"
    end
  end

end
