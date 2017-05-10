class CreateCategoryFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :category_foods do |t|
      t.integer :food_id
      t.integer :category_id

      t.timestamps
    end
  end
end
