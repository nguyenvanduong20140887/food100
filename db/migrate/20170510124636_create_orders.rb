class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :username
      t.string :phone
      t.string :address
      t.datetime :time
      t.float :total

      t.timestamps
    end
  end
end
