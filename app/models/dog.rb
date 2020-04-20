class Dog < ActiveRecord::Base
  has_many :tricks
  has_many :ownerships
  has_many :owners, through: :ownerships
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  def number_of_tricks
    self.tricks.length
  end

  def alphabetical_tricks
    self.tricks.order(:title)
  end

  def alphabetical_tricks_limit(num)
    self.alphabetical_tricks.limit(num)
  end

  def self.average_age
    Dog.average(:age).round(2)
  end

  def self.by_breed(breed)
    Dog.where(breed: breed)
  end

  def self.breeds
    Dog.pluck(:breed)
  end

  def self.unique_breeds
    self.breeds.uniq
  end

  def self.age_greater_than(x)
    Dog.where("age > ?", x)
  end

  def self.sort_by_name
    Dog.order(:name)
  end

  def self.sort_by_name_reverse
    Dog.order(name: :desc)
  end

  def self.owned_more_than_3_years
    Dog.joins(:ownerships).where('ownerships.length > 3')
  end
end