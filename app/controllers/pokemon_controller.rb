class PokemonController < ApplicationController
	def capture
		currPkmn = Pokemon.find(params[:id])
		currPkmn.trainer_id = current_trainer.id
		currPkmn.save
		redirect_to root_path
	end

	def damage
		currPkmn = Pokemon.find(params[:id])
		currPkmn.health -= 10
		if currPkmn.health <= 0
			currPkmn.destroy
		else
			currPkmn.save
		end
		redirect_to trainer_path(currPkmn.trainer_id)
	end

end
