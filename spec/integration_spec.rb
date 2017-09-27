require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new recipe', {:type => :feature}) do
  it('allows a user to add a recipe') do
    visit('/')
    click_link('Add a recipe to the box!')
    fill_in('title', :with => 'Apple Pie')
    click_button('Add Recipe')
    expect(page).to have_content('Apple Pie')
  end
end

describe('updating a recipe', {:type => :feature}) do
  it('allows a user to delete a recipe') do
    visit('/')
    click_link('Add a recipe to the box!')
    fill_in('title', :with => 'Apple Pie')
    click_button('Add Recipe')
    click_link('Apple Pie')
    fill_in('title', :with => 'Apple Pie and Cheese!')
    click_button('Update Recipe')
    expect(page).to have_content('Apple Pie and Cheese!')
  end
end
