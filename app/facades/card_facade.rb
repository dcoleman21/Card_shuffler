class CardFacade
  def self.create_affirmation_cards
    cards = Card.all
    if cards.empty?
      create_images
      create_quotes
      create_card
    end
    cards
  end

  def self.create_images
    images = ImageService.fetch_image_info
    images[:results].each do |image_info|
      data = {
              description: image_info[:alt_description],
              image: image_info[:urls][:small],
              source: image_info[:user][:name]
      }
      Image.create(data)
    end
  end

  def self.create_quotes
    quotes = QuotesService.fetch_all
    quotes.each do |quote_info|
      data = {
              quote: quote_info[:q],
              author: quote_info[:a]
      }
      Quote.create(data)
    end
  end

  def self.create_card
    counter = 1
    while counter < 50
      image = Image.all.sample
      quote = Quote.find(counter)
      # ArgumentError:
      #  wrong number of arguments (given 2, expected 0..1)
      Card.create(image, quote)
      counter += 1
    end
  end
end
