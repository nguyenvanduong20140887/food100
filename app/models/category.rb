class Category < ApplicationRecord
  has_many :category_foods
  has_many :foods, through: :category_foods
end
