require 'rails_helper'

RSpec.describe 'Welcome page features', type: :feature do
  it "displays a welcome message, description and button to view cards" do
    visit root_path
    expect(page).to have_content('Welcome to Daily Inspiration')
    expect(page).to have_content('Daily Inspiration hopes to help you start your day off with positive affirmations.')
    expect(page).to have_button('Go to Cards')
  end

  it "can click go to cards button" do
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
     stub_request(:get, "https://zenquotes.io/api/quotes").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/json',
       	  'User-Agent'=>'Faraday v1.5.1'
           }).
         to_return(status: 200, body: quote_response, headers: {})
    visit root_path
    expect(page).to have_button('Go to Cards')
    click_on 'Go to Cards'
    expect(current_path).to eq(cards_path)
  end
end
