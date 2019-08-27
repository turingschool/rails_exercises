require 'rails_helper'

RSpec.describe "Aliasing" do
  # The following exercises will require you to add an
  # alias to some of the routes you created in previous exercises.
  
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

  it "can alias the nonrestful subtract path that takes multiple parameters" do
    page.driver.submit :delete, subtract_path(4, 10), {}

    expect(page).to have_content(6)
  end

  it "can alias a namespaced route" do
    visit admin_user_path(2)

    expect(page).to have_content("This is the admin view of user with id 2")
  end
end
