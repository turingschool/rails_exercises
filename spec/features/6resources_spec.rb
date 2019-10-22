require 'rails_helper'

RSpec.describe "Resources" do
  # These tests are copied from the previous exercises:
  #  "1restful_routing_spec.rb", "2nested_routing_spec.rb", and "5aliasing_spec".
  # You should be able to replace the "handrolled" routes in your routes file
  # with the 'resources' syntax to make these tests pass.
  # For tricks, we only need 3 routes, so use the `only` option
  # to limit `resources` to just these 3 routes.

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

  it "can alias the index page" do
    visit dogs_path

    expect(current_path).to eq("/dogs")
    expect(page).to have_content("This page shows all the dogs!")
  end

  it "can alias the dog show page" do
    visit dog_path(2)

    expect(page).to have_content("This page shows dog with id 2")
  end

  it "the dog show page path helper is the same as the destroy path helper" do
    page.driver.submit :delete, dog_path(2), {}

    expect(page).to have_content("Normally, this route would destroy dog with id 2 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")
  end

  it "can alias a nested route" do
    visit dog_tricks_path(2)

    expect(page).to have_content("This page shows all the tricks for dog with id 2")
  end

  it "can alias a namespaced route" do
    visit admin_user_path(2)

    expect(page).to have_content("This is the admin view of user with id 2")
  end
end
