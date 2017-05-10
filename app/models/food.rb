class Food < ApplicationRecord
  has_many :category_foods
  has_many :categories, through: :category_foods
  has_many :combo_details
  has_many :combos, through: :combo_details
  has_many :orderlines
  has_many :orders, through: :orderlines
end
