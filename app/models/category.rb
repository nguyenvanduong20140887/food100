class Category < ApplicationRecord
  has_many :category_foods
  has_many :foods, through: :category_foods
  validates :name, presence: true

  scope :search, -> search {where "name LIKE ?", "%#{search}%"}
  scope :order_in_scope, -> {Category.all.order name: :asc}
  scope :find_follow_category, -> id {Food.joins(:categories).where(categories: {id: id})}
end
