class Character < ActiveRecord::Base

  def max_hitpoints
    toughness * 10
  end

  def dead?
    hitpoints < 0
  end

end
