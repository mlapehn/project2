
class Pokemonevolve < Sinatra::Base
	# General route actions
	get '/' do
		erb :home
	end

	get '/edit' do
		erb :edit
	end

	# get '/home.erb' do
	# 	erb :home
	# end

	# get '/new.erb' do
	# 	erb :new
	# end

end