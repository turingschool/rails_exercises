class Owner < ApplicationRecord
  has_many :ownerships
  has_many :dogs, through: :ownership
end
