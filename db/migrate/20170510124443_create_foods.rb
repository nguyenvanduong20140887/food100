class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :description

      t.timestamps
    end
    add_index :foods, :name, unique: true
  end
end
