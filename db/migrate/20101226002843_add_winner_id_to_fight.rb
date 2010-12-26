class AddWinnerIdToFight < ActiveRecord::Migration
  def self.up
    add_column :fights, :winner_id, :integer
  end

  def self.down
    remove_column :fights, :winner_id
  end
end
