class CardsController < ApplicationController
  def index
    deck = Card.all
    if deck.card.none?
      CardFacade.create_affirmation_card(images, quotes)
    end
    @cards = deck.cards
  end
end
