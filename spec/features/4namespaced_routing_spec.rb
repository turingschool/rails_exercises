require 'rails_helper'

RSpec.describe "Namespaced Routing" do
  # The following routes will require you to make an admin namespace.
  # Each one should route to an action in one of the controllers under
  # `app/controllers/admin`. For this exercise and the following exercises,
  # you should use the Rails Routing guide to help you: https://guides.rubyonrails.org/routing.html

  it "can route to an admin user show page" do
    visit '/admin/users/4'

    expect(current_path).to eq('/admin/users/4')
    expect(page).to have_content("This is the admin view of user with id 4")

    visit '/admin/users/9'

    expect(current_path).to eq('/admin/users/9')
    expect(page).to have_content("This is the admin view of user with id 9")
  end

  it "can route to an admin dogs index page" do
    visit '/admin/dogs'

    expect(current_path).to eq('/admin/dogs')
    expect(page).to have_content("This is the admin view of all dogs")
  end

  it "can route to an admin view of a dogs's tricks" do
    visit '/admin/dogs/4/tricks'

    expect(current_path).to eq('/admin/dogs/4/tricks')
    expect(page).to have_content("This is the admin view of tricks for dog with id 4")

    visit '/admin/dogs/9/tricks'

    expect(current_path).to eq('/admin/dogs/9/tricks')
    expect(page).to have_content("This is the admin view of tricks for dog with id 9")
  end

  it "can route to destroy a trick" do
    page.driver.submit :delete, "/admin/tricks/4", {}

    expect(page).to have_content("Normally, this route would destroy a trick with id 4 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")

    page.driver.submit :delete, "/admin/tricks/9", {}

    expect(page).to have_content("Normally, this route would destroy a trick with id 9 then redirect to a different page, but since we are just routing right now, we have rendered a view to keep it simple")
  end
end
