class CardsController < ApplicationController
  def index
    CardFacade.create_affirmation_cards
    @cards = Card.all
  end
end
