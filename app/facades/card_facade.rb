class CardFacade
  def self.create_affirmation_cards
    images = ImageService.fetch_image_info
    quotes = QuotesService.fetch_all
    create_images(images)
    create_quotes(quotes)
    create_card(images, quotes)
  end

  def create_images
    images[:results].each do |image|
      Image.create(image)
    end
  end

  def create_quotes
    quotes.each do |quote|
      Quote.create(quote)
    end
  end

  def create_card
    Card.create(images, quotes)
  end
end
