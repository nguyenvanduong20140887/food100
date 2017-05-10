class CreateComboDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :combo_details do |t|
      t.integer :food_id
      t.integer :combo_id

      t.timestamps
    end
  end
end
