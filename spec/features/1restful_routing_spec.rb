require 'rails_helper'

RSpec.describe "ReSTful routing" do
  it "can route to all the dogs" do
    visit "/dogs"

    expect(current_path).to eq("/dogs")
    expect(page).to have_content("This page shows all the dogs!")
  end

  it "can route to a specific dog" do
    visit "/dogs/4"

    expect(current_path).to eq("/dogs/4")
    expect(page).to have_content("This page shows dog with id 4")

    visit "/dogs/9"

    expect(current_path).to eq("/dogs/9")
    expect(page).to have_content("This page shows dog with id 9")
  end

  it "can route a form for a new dog" do
    visit '/dogs/new'

    expect(current_path).to eq('/dogs/new')
    expect(page).to have_content("This page has a form for a new dog")
  end

  it "can route a form to edit a dog" do
    visit '/dogs/4/edit'

    expect(current_path).to eq('/dogs/4/edit')
    expect(page).to have_content("This page has a form to edit dog with id 4")

    visit '/dogs/9/edit'

    expect(current_path).to eq('/dogs/9/edit')
    expect(page).to have_content("This page has a form to edit dog with id 9")
  end

  it "can route to create a new dog" do
    page.driver.post("/dogs")

    expect(page).to have_content("Normally, this route would create a new dog and then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")
  end

  it "can route to update a dog" do
    page.driver.submit :patch, "/dogs/4", {}

    expect(page).to have_content("Normally, this route would update dog with id 4 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")

    page.driver.submit :patch, "/dogs/9", {}

    expect(page).to have_content("Normally, this route would update dog with id 9 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")
  end

  it "can route to destroy a dog" do
    page.driver.submit :delete, "/dogs/4", {}

    expect(page).to have_content("Normally, this route would destroy dog with id 4 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")

    page.driver.submit :delete, "/dogs/9", {}

    expect(page).to have_content("Normally, this route would destroy dog with id 9 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")
  end
end
