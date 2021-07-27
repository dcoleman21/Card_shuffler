class Card
  def initialize(images, quotes)
    @images = images
    @quotes = quotes
  end

  def random_image
    image_info = @images.random
    {
      description: image_info[:alt_description],
      image: image_info[:urls][:small],
      source: image_info[:user][:name]
    }
  end

  def random_quote
    quote_info = @quotes.random
    {
      quote: quote_info[:q],
      author: quote_info[:a]
    }
  end
end
