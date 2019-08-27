require 'rails_helper'

RSpec.describe "ReSTful actions" do
  # These exercises require you to perform the standard
  # CRUD actions in your controllers that correspond to
  # a restful route.

  it "can show all dogs" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
    phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
    odell = Dog.create!(name: "Odell", breed: "schnoodle", age: 7)

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

  it "can show a specific dog" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)

    visit "/dogs/#{samson.id}"

    expect(page).to have_content(samson.name)
    expect(page).to have_content(samson.breed)
    expect(page).to have_content(samson.age)
  end

  it "can show a form for a new dog" do
    visit "/dogs/new"

    expect(page).to have_field(:name)
    expect(page).to have_field(:age)
    expect(page).to have_field(:breed)
    expect(page).to have_button("Create Dog")
  end

  it "can create a new dog" do
    visit "/dogs/new"

    new_name = "Samson"
    new_age = 14
    new_breed = "Golden Retriever"

    fill_in :name, with: new_name
    fill_in :age, with: new_age
    fill_in :breed, with: new_breed

    click_button("Create Dog")

    expect(current_path).to eq("/dogs")
    expect(page).to have_content(new_name)
    expect(page).to have_content(new_age)
    expect(page).to have_content(new_breed)
  end

  it "can show a form to edit a dog" do
    samson = Dog.create(name: "Samson", age: 14, breed: "Golden Retriever")
    visit "/dogs/#{samson.id}/edit"

    expect(page).to have_content("Editing #{samson.name}")

    expect(page).to have_field(:name)
    expect(page).to have_field(:age)
    expect(page).to have_field(:breed)
    expect(page).to have_button("Update Dog")
  end

  it "can update a dog" do
    samson = Dog.create(name: "Samson", age: 9, breed: "Lab")
    visit "/dogs/#{samson.id}/edit"

    new_name = "Samson"
    new_age = 14
    new_breed = "Golden Retriever"

    fill_in :name, with: new_name
    fill_in :age, with: new_age
    fill_in :breed, with: new_breed

    click_button("Update Dog")

    expect(current_path).to eq("/dogs")
    expect(page).to have_content(new_name)
    expect(page).to have_content(new_age)
    expect(page).to have_content(new_breed)
  end

  it "can destroy a dog from the dog show page" do
    samson = Dog.create(name: "Samson", age: 9, breed: "Lab")

    visit "/dogs/#{samson.id}"

    click_button "delete"

    expect(current_path).to eq("/dogs")
    expect(page).to_not have_content(samson.name)
    expect(page).to_not have_content(samson.age)
    expect(page).to_not have_content(samson.breed)
  end
end
