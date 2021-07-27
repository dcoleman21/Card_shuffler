class ImageService
  def self.fetch_image_info
    response = conn.get('/search/photos') do |req|
      req.params['query'] = 'animal'
      req.params['page'] = 1
      req.params['per_page'] = 50
      req.params['orientation'] = 'landscape'
      req.params['client_id'] = ENV['IMAGE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com', headers: { 'Content-type' => 'application/json' })
  end
end
