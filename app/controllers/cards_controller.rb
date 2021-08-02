class CardsController < ApplicationController
  def index
    all_cards = CardFacade.create_affirmation_cards
    @featured_card = all_cards.get_random_card
  end
end
