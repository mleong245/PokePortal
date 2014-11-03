class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    @pokemon = Pokemon.where(trainer_id: @trainer)
    @heal_pkmn = Pokemon.where("trainer_id = ? AND health < ?", @trainer, 100)
  end

end
