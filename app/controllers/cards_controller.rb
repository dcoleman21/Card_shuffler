class CardsController < ApplicationController
  def index
    CardFacade.create_affirmation_cards
  end
end
