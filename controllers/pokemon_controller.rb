class Pokemonevolve < Sinatra::Base
  
  set :method_override, true

  Variables for create method
  @pokemon.candy = candy
  @pokemon.evolve = evolve_cost
  @pokemon.pokemoncount = pokemon_count

  # RESTful Pokemon Controller Actions
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
    first_evolve = (candy/evolve_cost)

    remainder = candy - (first_evolve * evolve_cost)

    extra_evolves = ((remainder + pokemon_count)/evolve_cost)

    total = extra_evolves + first_evolve
    # initial_evolve = initial
    # (candy/evolve) = initial_evolve

    # (candy - (initial * evovle)) = remander

    # extra_evolves = extra
    # ((remander + pokemoncount)/evolve) = extra_evolves

    # @total = total
    # (extra + initial) = total
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
