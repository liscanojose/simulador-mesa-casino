class GamesController < ApplicationController
  def index
    @player_rounds = Ticket.all
  end
end
