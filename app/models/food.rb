class Food < ApplicationRecord
  has_many :category_foods
  has_many :categories, through: :category_foods
  has_many :combo_details
  has_many :combos, through: :combo_details
  has_many :orderlines
  has_many :orders, through: :orderlines

  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :description, presence: true,
    length: {maximum: Settings.max_size_description}
end
