class CreateCategoryFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :category_foods do |t|
      t.integer :food_id
      t.integer :category_id

      t.timestamps
    end
    add_index :category_foods, :food_id
    add_index :category_foods, :category_id
    add_index :category_foods, [:food_id, :category_id], unique: true
  end
end
