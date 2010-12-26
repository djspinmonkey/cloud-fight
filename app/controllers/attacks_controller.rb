class AttacksController < ApplicationController
  def create
    fight = Fight.find(params[:attack][:fight_id])
    attacks = [Attack.new(params[:attack])]
    attacks << fight.counter(attack) unless fight.over?

    redirect_to fight, :notice => attacks.collect(&:results).flatten.join("<br/>")
  end
end
