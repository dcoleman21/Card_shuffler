require 'rails_helper'

describe 'Quotes Service' do
  before :each do
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
  end

  it 'can get quote info' do
    quotes_data = QuotesService.fetch_all
    expect(quotes_data).to be_an(Array)

    quotes_data.each do |quote_info|
      expect(quote_info).to be_a(Hash)

      expect(quote_info).to have_key(:q)
      expect(quote_info[:q]).to be_a(String)

      expect(quote_info).to have_key(:a)
      expect(quote_info[:a]).to be_a(String)
    end
  end
end
