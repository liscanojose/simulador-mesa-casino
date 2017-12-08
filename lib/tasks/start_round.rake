namespace :start_round do
  desc "start a new round each 3 minutes"
  task start: :environment do
    players=Player.all
    create_games = [false]
    create_game = false
    players.each do |player|
      if player.can_bet
        create_games.push(true)
      else
        create_games.push(false)
      end
    end
    create_games.each do |cg|
      if (cg == true)
        create_game = cg
      end
    end
    if create_game
      game = Game.new()
      game.save
      round = Round.new(:colour => game.get_colour)
      round.save
      game.enter_to_round(round,players)
    end

  end
end
