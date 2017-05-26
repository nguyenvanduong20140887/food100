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

  scope :search, -> search {where "name LIKE ?", "%#{search}%"}
  scope :order_in_scope, -> {Food.all.order name: :asc}
end
