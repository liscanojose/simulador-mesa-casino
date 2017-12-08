class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :player_colour_picked
      t.float :player_money_bet
      t.references :player, index: true
      t.references :round, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
