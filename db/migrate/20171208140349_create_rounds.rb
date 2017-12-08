class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :colour

      t.timestamps
    end
  end
end
