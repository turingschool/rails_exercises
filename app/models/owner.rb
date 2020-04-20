class Owner < ActiveRecord::Base
  has_many :ownerships
  has_many :dogs, through: :ownerships

  def self.all_dog_names
    Owner.joins(:dogs).pluck('dogs.name')
  end

  def self.unique_dog_names
    self.all_dog_names.uniq.sort.reverse
  end
end