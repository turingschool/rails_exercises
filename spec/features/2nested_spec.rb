require 'rails_helper'

RSpec.describe "Nested Resources" do
  # These exercises require you to perform the standard
  # CRUD actions for nested resources in your controllers
  # that correspond to a restful route.

  it "can show all tricks for a dog" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
    sit = samson.tricks.create!(title: "Sit")
    shake = samson.tricks.create!(title: "Shake")
    play_dead = samson.tricks.create!(title: "Play Dead")

    visit "/dogs/#{samson.id}/tricks"

    expect(page).to have_content("Tricks for #{samson.name}")
    expect(page).to have_content(sit.title)
    expect(page).to have_content(shake.title)
    expect(page).to have_content(play_dead.title)
  end

  it "can show a form for a new trick" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)

    visit "/dogs/#{samson.id}/tricks/new"

    expect(page).to have_content("Create a trick for #{samson.name}")
    expect(page).to have_field(:title)
    expect(page).to have_button("Create Trick")
  end

  it "can create a new trick for a dog" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)

    visit "/dogs/#{samson.id}/tricks/new"

    new_title = "Sit"

    fill_in :title, with: new_title
    click_button "Create Trick"

    expect(current_path).to eq("/dogs/#{samson.id}/tricks")
    expect(page).to have_content(new_title)
  end
end
