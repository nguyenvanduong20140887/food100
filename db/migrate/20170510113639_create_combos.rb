class CreateCombos < ActiveRecord::Migration[5.0]
  def change
    create_table :combos do |t|
      t.string :name

      t.timestamps
    end
    add_index :combos, :name, unique: true
  end
end
