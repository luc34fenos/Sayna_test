class CreateCorrects < ActiveRecord::Migration[5.2]
  def change
    create_table :corrects do |t|
      t.string :list
      t.belongs_to :liste, index: true

      t.timestamps
    end
  end
end
