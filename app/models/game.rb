class Game < ActiveRecord::Base
  has_many :tickets


  def get_colour
    case rand(1..100)
      when  1..2   then "Verde"
      when 3..51   then "Negro"
      when 52..100 then "Rojo"
    end
  end

  def result(round, colour_player)
    if round.colour.upcase   == colour_player
      return "Ganaste"
    else
      return "Perdiste"
    end
  end


  def money_owned(round, colour_player, player_money_bet)
      if round.tickets.last.game.result(round,colour_player)  ==  "Ganaste" && (colour_player.upcase == "NEGRO" ||  colour_player.upcase =="ROJO")
        return (player_money_bet*2)
      elsif round.tickets.last.game.result(round,colour_player)  ==  "Ganaste" && colour_player.upcase =="VERDE"
        return (player_money_bet*15)
      else
        return -(player_money_bet)
      end
  end

  def start_round(round)
      round = Round.new
      round.update(:colour =>round.get_colour)#probar con create
  end

  def enter_to_round(round,players)

    players.each do |player|
      if player.money > 0
        ticket = Ticket.new()
        ticket.player = player
        ticket.round = round
        ticket.game = self
        player_money_bet = player.money_bet
        player_colour = player.get_colour.upcase
        ticket.save
        ticket.update(:player_money_bet => player_money_bet,:player_colour_picked =>player_colour,:player_money_owned =>money_owned(round, player_colour, player_money_bet))
        if result(round, ticket.player_colour_picked)=="Ganaste"

          money_mount = player.money+ticket.player_money_owned-player_money_bet
          player.update(:money => money_mount)
        else

          money_mount = player.money-player_money_bet
          player.update(:money => money_mount)
        end
      end
    end
  end

end
