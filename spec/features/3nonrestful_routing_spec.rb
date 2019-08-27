require 'rails_helper'

RSpec.describe "Nonrestful routing" do
  # All the routes in these exercises are nonrestful. There
  # is no convention for creating/handling these routes. All these
  # routes should route to an action in the NonrestfulController.
  
  it "can route to the nonrestful controller's hello action" do
    visit '/hello'

    expect(page).to have_content("Hello! This route isn't restful!")
  end

  it "can greet you by name" do
    visit '/greetings/logan'

    expect(page).to have_content("Greetings, logan!")

    visit '/greetings/becca'

    expect(page).to have_content("Greetings, becca!")
  end

  it "can deactivate an item" do
    page.driver.submit :patch, "/items/4/deactivate", {}

    expect(page).to have_content("Item with id 4 is deactivated")

    page.driver.submit :patch, "/items/9/deactivate", {}

    expect(page).to have_content("Item with id 9 is deactivated")
  end

  it "can subtract" do
    page.driver.submit :delete, '/subtract/3/from/10', {}

    expect(page).to have_content("7")

    page.driver.submit :delete, '/subtract/9/from/5', {}

    expect(page).to have_content("-4")
  end

end
