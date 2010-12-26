class AttacksController < ApplicationController
  def create
    attacks = [Attack.new(params[:attack])]
    fight = attacks.first.fight
    attacks << fight.counter_attack unless fight.over?

    redirect_to fight, :notice => attacks.collect(&:results).flatten.join("<br/>")
  end
end
