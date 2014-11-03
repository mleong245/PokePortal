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

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.health = 100
		@pokemon.trainer_id = current_trainer.id
		@pokemon.level = 1
		if @pokemon.save
			redirect_to trainer_path(current_trainer)
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to new_pokemon_path
		end
	end

	def pokemon_params
		params.require(:pokemon).permit(:name)
	end

end
