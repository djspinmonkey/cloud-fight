class CreateFights < ActiveRecord::Migration
  def self.up
    create_table :fights do |t|
      t.integer :player_id
      t.integer :opponent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fights
  end
end
