class PokemonController < ApplicationController
	def capture
		currPkmn = Pokemon.find(params[:id])
		currPkmn.trainer_id = current_trainer.id
		currPkmn.save
		redirect_to root_path
	end
end
