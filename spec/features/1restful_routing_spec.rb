require 'rails_helper'

RSpec.describe "ReSTful routing" do
  # All the routes in these exercises follow ReSFul routing
  # conventions, as well as the Rails convention for handling
  # those routes. All routes should route to an action in the
  # DogsController. You should 'handroll' all routes, meaning you
  # should write the verb, path, controller, and action manually
  # rather than using the `resources` syntax.

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
    # You'll notice that this test passes without having to do anything!
    # Sometimes, you don't need a controller to do anything and Rails
    # will automatically load the view even if the controller action is
    # undefined. However, it is best practice to add the empty action to
    # explicitly communicate that the controller doesn't need to do anything.
    # Add that empty action before moving on to the next exercise.

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
