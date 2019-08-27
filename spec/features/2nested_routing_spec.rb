require 'rails_helper'

RSpec.describe "Nested routing" do
  # All the routes in these exercises follow ReSFul routing
  # conventions for nested resources, as well as the Rails convention
  # for handling those routes. All routes should route to an action
  # in the TricksController. You should continue to "handroll" all routes.

  it "can route to all of a dog's tricks" do
    visit "/dogs/4/tricks"

    expect(current_path).to eq("/dogs/4/tricks")
    expect(page).to have_content("This page shows all the tricks for dog with id 4")

    visit "/dogs/9/tricks"

    expect(current_path).to eq("/dogs/9/tricks")
    expect(page).to have_content("This page shows all the tricks for dog with id 9")
  end

  it "can route a form for a new trick for a dog" do
    visit '/dogs/4/tricks/new'

    expect(current_path).to eq('/dogs/4/tricks/new')
    expect(page).to have_content("This page has a form for a new trick for dog with id 4")

    visit '/dogs/9/tricks/new'

    expect(current_path).to eq('/dogs/9/tricks/new')
    expect(page).to have_content("This page has a form for a new trick for dog with id 9")
  end

  it "can route to create a new trick for a dog" do
    page.driver.submit :post, "/dogs/4/tricks", {}

    expect(page).to have_content("Normally, this route would create a new trick for dog with id 4 and then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")

    page.driver.submit :post, "/dogs/9/tricks", {}

    expect(page).to have_content("Normally, this route would create a new trick for dog with id 9 and then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")
  end
end
