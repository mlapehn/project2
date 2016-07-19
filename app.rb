
class Pokemonevolve < Sinatra::Base
	# General route actions
	get '/' do
		erb :home
	end

	get '/edit' do
		erb :edit
	end

end