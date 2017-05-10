class Combo < ApplicationRecord
  has_many :combo_details
  has_many :foods, through: :combo_details
end
