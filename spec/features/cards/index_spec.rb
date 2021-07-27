require 'rails_helper'

RSpec.describe 'Cards index page features', type: :feature do
  it "can create cards", :vcr do
    # all_images = File.read('spec/fixtures/get_images.json')
    # stub_request(:get, "https://api.unsplash.com/search/photos/?client_id=ENV['IMAGE_API_KEY']&query=animal&page=1&orientation=landscape").to_return(status: 200, body: all_images, headers: {})
    visit root_path
    click_on 'Go to Cards'
    expect(current_path).to eq(cards_path)
    expect { visit cards_path }.to change { Card.count }.by(1)
  end

  xit "displays a message" do
    visit root_path
    click_on 'Go to Cards'
    expect(current_path).to eq(cards_path)
    expect(page).to have_content('Here are a collection of affirmations')
    expect(page).to have_content('You can shuffle to see other affirmations')
  end


  xit "has cards that include an image, description, source, quote and author" do
    within(first('.card')) do
      expect(page).to have_css('.description')
      expect(page).to have_css('.image')
      expect(page).to have_css('.source')
      expect(page).to have_css('.quote')
      expect(page).to have_css('.author')
    end
  end
end
