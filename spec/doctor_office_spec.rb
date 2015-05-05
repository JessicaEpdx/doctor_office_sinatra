require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('going to the doctors list', {:type => :feature}) do
  it('allows a user to see a list of doctors') do
    visit('/')
    click_link('See all your damn doctors!')
    expect(page).to have_content("target page")
  end
end
