require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates a word which then displays on the words page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'unusual')
    click_on('Go!')
    expect(page).to have_content('unusual')
  end
end

describe('create a definition for a word', {:type => :feature}) do
  it('creates a definition for a word which then displays on the page for that word') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'interesting')
    click_on('Go!')
    click_on('interesting')
    fill_in('definition', :with => 'very cool')
    click_on('Add definition!')
    expect(page).to have_content('very cool')
  end
end