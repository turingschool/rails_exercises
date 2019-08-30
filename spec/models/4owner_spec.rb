require 'rails_helper'

RSpec.describe Owner do
  describe "relationships" do
    it {should have_many :ownerships}
    it {should have_many(:dogs).through(:ownerships)}
  end

  describe "methods" do
    it "can get the names of all dogs associated with all owners sorted alphabetically" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      cassidy = Dog.create!(name: "Cassidy", breed: "Golden Retriever", age: 10)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
      brian = Owner.create!(name: "Brian", age: 25)
      meg = Owner.create!(name: "Meg", age: 26)
      brian.ownerships.create(dog: samson, length: 13)
      brian.ownerships.create(dog: odell, length: 0)
      meg.ownerships.create(dog: odell, length: 4)
      meg.ownerships.create(dog: phoebe, length: 2)

      expected = ["Odell", "Odell", "Phoebe", "Samson"]
      expect(Owner.all_dog_names.sort).to eq(expected)
    end

    it "can get unique names of all dogs associated with all owners sorted reverse alphabetically" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      cassidy = Dog.create!(name: "Cassidy", breed: "Golden Retriever", age: 10)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
      brian = Owner.create!(name: "Brian", age: 25)
      meg = Owner.create!(name: "Meg", age: 26)
      brian.ownerships.create(dog: samson, length: 13)
      brian.ownerships.create(dog: odell, length: 0)
      meg.ownerships.create(dog: odell, length: 4)
      meg.ownerships.create(dog: phoebe, length: 2)

      expected = ["Samson", "Phoebe", "Odell"]
      expect(Owner.unique_dog_names).to eq(expected)
    end
  end
end
