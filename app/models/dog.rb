class Dog < ApplicationRecord
  has_many :tricks
  has_many :ownerships
  has_many :owners, through: :ownerships
end
