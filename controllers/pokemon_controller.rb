class Pokemonevolve < Sinatra::Base
  
  set :method_override, true

  # Variables for create method
  # @pokemon.name = pn
  # @pokemon.candy = candy
  # @pokemon.evolve = evolve
  # @pokemon.pokemoncount = pokemoncount

  # RESTful Artist Controller Actions
  # index
  get '/pokemon' do
    @pokemons = Pokemon.all
    erb(:"pokemon/index")
  end

  # API
  get '/api' do
    pokemon = Pokemon.all.to_json
    pokemon
  end

  # new
  get '/pokemon/new' do
    @pokemon = Pokemon.new
    erb(:"pokemon/new")
  end

  # create
  post '/pokemon' do
    @pokemon = Pokemon.new(params[:pokemon])
    p params[:pokemon]
    Pokemon.create(params[:pokemon])
    redirect to('/pokemon')

    # ***********************************************************************
        # Candy/Evolve cost = initial evolve
    # (candy/evolve) = initial_evolve
    # initial_evolve = initial

    # Candy - (initial evolve * evolve cost) = remander
    # (candy - (initial * )) = remander

    # ((remander + #of pokemon)/evolve cost) = extra evolves
    # ((remander + pokemoncount)/evolve) = extra_evolves
    # extra_evolves = extra

    # extra evolves + initial evolve = total
    # (extra + initial) = total
    # @total = total
    #  ***********************************************************************
  end

  # show
  get '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    erb(:"pokemon/show")
  end

  # edit
  get '/pokemon/:id/edit' do
    @pokemon = Pokemon.find(params[:id])
    erb(:"update")
  end

  # update
  put '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update_attributes(params[:pokemon])
      redirect("/pokemon")
    else
      erb(:"pokemon/edit")
    end
  end

  # delete
  delete '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.destroy
      redirect('/pokemon')
    else
      redirect("/pokemon/#{@pokemon.id}")
    end
  end

end
