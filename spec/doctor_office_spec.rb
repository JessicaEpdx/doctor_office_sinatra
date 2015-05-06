require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('going to the doctors list', {:type => :feature}) do
  it('allows a user to see a list of doctors') do
    visit('/')
    click_link('See all your damn doctors!')
    expect(page).to have_content("All Doctors")
  end
end

describe('add doctor form path', {:type => :feature}) do
  it('allows user to add a doctor') do
    visit('/')
    fill_in('doc', :with => 'Dr. Dre')
    fill_in('specialty', :with => 'Phat Beatz')
    click_button('Add')
    expect(page).to have_content('Dr. Dre')
  end
end
