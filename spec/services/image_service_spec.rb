require 'rails_helper'

describe 'Image Service' do
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
  
  it 'can get image info' do
    images_data = ImageService.fetch_image_info
    expect(images_data).to be_a(Hash)

    images_data[:results].each do |image_info|
      expect(image_info).to be_a(Hash)

      expect(image_info).to have_key(:alt_description)
      expect(image_info[:alt_description]).to be_a(String)

      expect(image_info).to have_key(:urls)
      expect(image_info[:urls]).to be_a(Hash)

      expect(image_info[:urls]).to have_key(:small)
      expect(image_info[:urls][:small]).to be_a(String)

      expect(image_info).to have_key(:user)
      expect(image_info[:user]).to be_a(Hash)

      expect(image_info[:user]).to have_key(:name)
      expect(image_info[:user][:name]).to be_a(String)
    end
  end
end
