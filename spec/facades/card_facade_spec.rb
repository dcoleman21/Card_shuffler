require 'rails_helper'

describe 'Cards Facade' do
  before :each do
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
  end

  it 'can create affirmation_cards' do
    cards = CardFacade.create_affirmation_cards

    expect(cards.first).to be_a(Card)
    expect(cards.first.image_id).to be_an(Integer)
    expect(cards.first.quote_id).to be_an(Integer)
  end

  it 'can create images for a card' do
    card = CardFacade.create_images

    expect(card).to be_an(Array)
    expect(card.first).to be_a(Hash)
    expect(card.first[:alt_description]).to be_a(String)
    expect(card.first[:urls][:small]).to be_a(String)
    expect(card.first[:user][:name]).to be_a(String)
  end

  it 'can create quotes for a card' do
    card = CardFacade.create_quotes

    expect(card).to be_an(Array)
    expect(card.first).to be_a(Hash)
    expect(card.first[:q]).to be_a(String)
    expect(card.first[:a]).to be_a(String)
  end
end
