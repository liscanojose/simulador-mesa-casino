class Player < ActiveRecord::Base
  has_one :ticket
  before_save :default_values

  validates :first_name, presence: true
  validates :rut, presence: true, uniqueness: true
  validates :last_name, presence: true


  def default_values
    self.money ||= 10000
  end

  #apuesta
  def money_bet
    if self.money > 1000
      if self.rain_posibility < 50
        self.money*(rand(0.08..0.15))
      else
        self.money*(rand(0.04..0.1))
      end
    elsif self.money <= 1000 && self.money > 0
      self.money
    else 0
    end
  end

  #probabilidad de lluvia
  def rain_posibility
    climas = HTTParty.get('https://api.darksky.net/forecast/53ea6cffc61c9fd466713d4149591a43/-33.4488897,-70.6692655',
    :headers =>{'Content-Type' => 'application/json'} )
    return climas["currently"]["precipProbability"]
  end

  def get_colour
    case rand(1..100)
      when  1..2   then "Verde"
      when 3..51   then "Negro"
      when 52..100 then "Rojo"
    end
  end

  def can_bet
    if self.money > 0
      true
    else
      false
    end
  end

end
