require "rails_helper"

RSpec.describe "Many to Many Controller Actions" do
  it "can show owners and their dogs" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
    phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
    odell = Dog.create!(name: "Odell", breed: "schnoodle", age: 7)

    meg = Owner.create(name: "Meg")
    brian = Owner.create(name: "Brian")

    ownership_1 = meg.ownerships.create(dog: phoebe, length: 4)
    ownership_2 = meg.ownerships.create(dog: odell, length: 5)
    ownership_3 = brian.ownerships.create(dog: samson, length: 12)
    ownership_4 = brian.ownerships.create(dog: phoebe, length: 1)

    visit "/owners"

    within "#owner-#{meg.id}" do
      expect(page).to have_content(meg.name)
      expect(page).to have_content("#{phoebe.name}, owned for #{ownership_1.length} years")
      expect(page).to have_content("#{odell.name}, owned for #{ownership_2.length} years")
    end

    within "#owner-#{brian.id}" do
      expect(page).to have_content(brian.name)
      expect(page).to have_content("#{samson.name}, owned for #{ownership_3.length} years")
      expect(page).to have_content("#{phoebe.name}, owned for #{ownership_4.length} years")
    end
  end

  it "can create a new owner for a dog" do
    phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)

    visit "/dogs/#{phoebe.id}/owners/new"

    new_name = "Meg"
    new_length = 5

    fill_in :name, with: new_name
    fill_in :length, with: new_length

    click_button "Create Owner"

    expect(current_path).to eq("/owners")
    new_owner = Owner.last
    within "#owner-#{new_owner.id}" do
      expect(page).to have_content(new_name)
      expect(page).to have_content("#{phoebe.name}, owned for #{new_length} years")
    end
  end

  it "can give an owner a new dog by selecting from a list of all dogs" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
    phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
    odell = Dog.create!(name: "Odell", breed: "schnoodle", age: 7)

    meg = Owner.create(name: "Meg")

    visit "/owners/#{meg.id}/dogs/adopt"

    within "#dog-#{phoebe.id}" do
      click_button "Adopt"
    end

    expect(current_path).to eq("/owners")
    within "#owner-#{meg.id}" do
      expect(page).to have_content("#{phoebe.name}, owned for 0 years")
    end
  end

  it "an owner can fill in a form with comma separated dog names to adopt" do
    samson = Dog.create!(name: "Samson", breed: "Golden Retriever", age: 14)
    phoebe = Dog.create!(name: "Phoebe", breed: "Golden Doodle", age: 11)
    odell = Dog.create!(name: "Odell", breed: "schnoodle", age: 7)

    meg = Owner.create(name: "Meg")

    visit "/owners/#{meg.id}/dogs/adopt"

    within ".dog_list" do
      fill_in :dogs, with: "Samson, Odell"
      click_button "Adopt"
    end

    expect(current_path).to eq("/owners")
    within "#owner-#{meg.id}" do
      expect(page).to have_content("#{samson.name}, owned for 0 years")
      expect(page).to have_content("#{odell.name}, owned for 0 years")
    end
  end
end
