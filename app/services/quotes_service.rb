class QuotesService
  def self.fetch_all
    response = conn.get('/api/quotes')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://zenquotes.io', headers: { 'Content-type' => 'application/json' })
  end
end
