require 'rails_helper'

RSpec.describe Dog do
  describe "associations" do
    it {should have_many :tricks}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :breed}
    it {should validate_numericality_of(:age).is_greater_than_or_equal_to(0)}
  end

  describe "methods" do
    it "can return a count of its tricks" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      sit = samson.tricks.create!(title: "Sit")
      shake = samson.tricks.create!(title: "Shake")
      lay_down = samson.tricks.create!(title: "Lay Down")

      expect(samson.number_of_tricks).to eq(3)
    end

    it "can return the average age of all dogs" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.average_age.round(2)).to eq(10.67)
    end

    it "can return dogs by breed" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      cassidy = Dog.create!(name: "Cassidy", breed: "Golden Retriever", age: 8)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.by_breed("Golden Retriever")).to eq([samson, cassidy])
      expect(Dog.by_breed("Schnoodle")).to eq([odell])
    end

    it "can return Dog breeds" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      cassidy = Dog.create!(name: "Cassidy", breed: "Golden Retriever", age: 8)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.breeds.sort).to eq(["Golden Doodle", "Golden Retriever", "Golden Retriever", "Schnoodle"])
    end

    it "can return unique Dog breeds" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      cassidy = Dog.create!(name: "Cassidy", breed: "Golden Retriever", age: 8)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.unique_breeds.sort).to eq(["Golden Doodle", "Golden Retriever", "Schnoodle"])
    end

    it "can return dogs by age greater than x" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.age_greater_than(10)).to eq([samson, phoebe])
      expect(Dog.age_greater_than(6)).to eq([samson, odell, phoebe])
    end

    it "can return all Dogs sorted alphabetically by name" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.sort_by_name).to eq([odell, phoebe, samson])
    end

    it "can return all Dogs sorted reverse alphabetically by name" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      odell = Dog.create!(name: "Odell", breed: "Schnoodle", age: 7)
      phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

      expect(Dog.sort_by_name_reverse).to eq([samson, phoebe, odell])
    end

    it "can return its tricks sorted alphabetically" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      sit = samson.tricks.create!(title: "Sit")
      shake = samson.tricks.create!(title: "Shake")
      lay_down = samson.tricks.create!(title: "Lay Down")

      expect(samson.alphabetical_tricks).to eq([lay_down, shake, sit])
    end

    it "can return a specific number of tricks sorted alphabetically" do
      samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
      sit = samson.tricks.create!(title: "Sit")
      shake = samson.tricks.create!(title: "Shake")
      lay_down = samson.tricks.create!(title: "Lay Down")

      expect(samson.alphabetical_tricks_limit(2)).to eq([lay_down, shake])
      expect(samson.alphabetical_tricks_limit(1)).to eq([lay_down])
    end

    it "can get dogs that have been owned for more than 3 years" do
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

      expected = [samson, odell]
      expect(Dog.owned_more_than_3_years).to eq(expected)
    end
  end

  describe "many to many relationship" do
    it {should have_many :ownerships}
    it {should have_many(:owners).through(:ownerships)}
  end
end
