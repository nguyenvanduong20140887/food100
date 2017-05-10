class Order < ApplicationRecord
  has_many :orderlines
  has_many :foods, through: :orderlines
end
