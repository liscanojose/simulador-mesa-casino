class AddPlayerMoneyOwnedToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :player_money_owned, :float
  end
end
