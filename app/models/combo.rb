class Combo < ApplicationRecord
  has_many :combo_details
  has_many :foods, through: :combo_details

  validates :name, presence: true
  scope :search, -> search {where "name LIKE ?", "%#{search}%"}
  scope :order_in_scope, -> {Combo.all.order name: :asc}
  scope :find_follow_combo, -> id {Food.joins(:combos).where(combos: {id: id})}
end
