class Attack
  attr_accessor :fight, :attacker, :defender, :power, :damage, :results

  def initialize (attribs)
    attribs.each do |k, v| 
      meth = "#{k}=".to_sym
      send(meth, v) if self.respond_to? meth
    end
    @fight    ||= Fight.find(attribs[:fight_id])
    @attacker ||= @fight.player
    @defender ||= @fight.opponent
    @power    ||= @attacker.strength

    self.resolve
  end

  # Calculates the damage of the attack and memoizes it.
  #
  def damage
    @damage ||= [(@power * (rand + 0.5)).to_i - @defender.toughness, 0].max
  end

  # Resolves the attack.
  #
  def resolve
    defender.hitpoints -= damage
    defender.save!

    @results = []
    @results << "#{attacker.name} does #{damage} damage to #{defender.name}."
    if defender.dead?
      @results << "#{attacker.name} has killed #{defender.name}!"
      fight.winner = attacker
      fight.save!
    end
  end

end
