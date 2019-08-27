require 'rails_helper'

RSpec.describe "ReSTful actions" do
  # These exercises require you to perform the standard
  # CRUD actions in your controllers that correspond to
  # a restful route.

  it "can show all dogs" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
    phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
    odell = Dog.create!(name: "Odell", breed: "schnoodle", age: 4)

    visit "/dogs"

    expect(page).to have_content(samson.name)
    expect(page).to have_content(samson.breed)
    expect(page).to have_content(samson.age)

    expect(page).to have_content(phoebe.name)
    expect(page).to have_content(phoebe.breed)
    expect(page).to have_content(phoebe.age)

    expect(page).to have_content(odell.name)
    expect(page).to have_content(odell.breed)
    expect(page).to have_content(odell.age)
  end
  
  it "can show a specific dog"
  it "can show a form for a new dog"
  it "can create a new dog"
  it "can show a form to edit a dog"
  it "can update a dog"
  it "can destroy a dog"
end
