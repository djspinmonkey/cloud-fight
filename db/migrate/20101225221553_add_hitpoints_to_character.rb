class AddHitpointsToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :hitpoints, :integer
  end

  def self.down
    remove_column :characters, :hitpoints
  end
end
