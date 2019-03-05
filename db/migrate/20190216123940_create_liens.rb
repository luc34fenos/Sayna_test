class CreateLiens < ActiveRecord::Migration[5.2]
  def change
    create_table :liens do |t|
      t.string :liengit
      t.belongs_to :liste, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
