class Fight < ActiveRecord::Base
  belongs_to :player, :class_name => 'Character'
  belongs_to :opponent, :class_name => 'Character'
  belongs_to :winner, :class_name => 'Character'

  after_create :initialize_hitpoints

  attr_accessor :results_string

  def initialize_hitpoints
    player.hitpoints = player.max_hitpoints
    player.save!

    opponent.hitpoints = opponent.max_hitpoints
    opponent.save!
  end

  # The opponent hits back!
  #
  def counter (attack)
    Attack.new(
      :fight => self,
      :attacker => opponent,
      :defender => player
    )
  end

  def display_string
    if over?
      "#{player.name} #{ (winner == player) ? '(winner!)' : '' } vs #{opponent.name} #{ (winner == opponent) ? '(winner!)' : '' }"
    else
      "#{player.name} (#{player.hitpoints}) vs #{opponent.name} (#{opponent.hitpoints})"
    end
  end

  def over?
    !winner.nil?
  end

  def loser
    (player == winner) ? opponent : player
  end
end
