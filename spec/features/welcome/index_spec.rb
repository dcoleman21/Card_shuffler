require 'rails_helper'

RSpec.describe 'Welcome page features', type: :feature do
  it "displays a welcome message, description and button to view cards" do
    visit root_path
    expect(page).to have_content('Welcome to Daily Inspiration')
    expect(page).to have_content('Daily Inspiration hopes to help you start your day off with positive affirmations.')
    expect(page).to have_button('Go to Cards')

  end

  it "can click go to cards button" do
    visit root_path
    expect(page).to have_button('Go to Cards')
    click_on 'Go to Cards'
    expect(current_path).to eq(cards_path)
  end
end
