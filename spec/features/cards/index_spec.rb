require 'rails_helper'

RSpec.describe 'Cards index page features', type: :feature do
  it "displays a message" do
    image_response = File.read('spec/fixtures/images.json')
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=43Jx1Z3Dbg_Ho8292hymGKBVHYuuhRKq2n9LPC1Gq8c&orientation=landscape&page=1&per_page=50&query=animal").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Content-Type'=>'application/json',
         'User-Agent'=>'Faraday v1.5.1'
          }).
        to_return(status: 200, body: image_response, headers: {})
    quote_response = File.read('spec/fixtures/quotes.json')
    stub_request(:get, "https://zenquotes.io/api/quotes").to_return(status: 200, body: quote_response)
    visit root_path
    click_on 'Go to Cards'
    expect(current_path).to eq(cards_path)
    expect(page).to have_content('Here is a collection of affirmations')
    expect(page).to have_content('You can shuffle to see other affirmations')
    expect(page).to have_button('Shuffle')
  end

  it "has cards that include an image, description, source, quote and author" do
    image_response = File.read('spec/fixtures/images.json')
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=43Jx1Z3Dbg_Ho8292hymGKBVHYuuhRKq2n9LPC1Gq8c&orientation=landscape&page=1&per_page=50&query=animal").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Content-Type'=>'application/json',
         'User-Agent'=>'Faraday v1.5.1'
          }).
        to_return(status: 200, body: image_response, headers: {})
    quote_response = File.read('spec/fixtures/quotes.json')
    stub_request(:get, "https://zenquotes.io/api/quotes").to_return(status: 200, body: quote_response)
    visit root_path
    click_on 'Go to Cards'
    expect(current_path).to eq(cards_path)
    # expect(page).to have_css('.cards', count: 50)
    within(first('.card')) do
      expect(page).to have_css('.description')
      expect(page).to have_css('.image')
      expect(page).to have_css('.source')
      expect(page).to have_css('.quote')
      expect(page).to have_css('.author')
    end
  end
end
