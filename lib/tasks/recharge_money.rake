namespace :recharge_money do
  desc "recharge 10000 to each player at end day"
  task each_day: :environment do
    players = Player.all
    players.each do |player|
      new_money=player.money+10000
      player.update(:money => new_money)
    end
  end
end

