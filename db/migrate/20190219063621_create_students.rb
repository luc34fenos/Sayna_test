class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.references :user, index: true
      t.string :firstname
      t.string :lastname, default: " "
      t.string :email
      t.integer :age
      t.string :datenais
      t.string :ville
      t.integer :note1, default: 0
      t.integer :note2, default: 0
      t.integer :correcteur1, default: 0
      t.integer :correcteur2, default: 0
      t.boolean :noted1, default: true
      t.boolean :noted2, default: true
      t.boolean :noted, default: true
      t.integer :joker, default: 3

    end
  end
end
