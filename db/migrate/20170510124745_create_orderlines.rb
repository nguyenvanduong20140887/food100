class CreateOrderlines < ActiveRecord::Migration[5.0]
  def change
    create_table :orderlines do |t|
      t.integer :food_id
      t.integer :order_id
      t.integer :number
      t.float :total

      t.timestamps
    end
  end
end
