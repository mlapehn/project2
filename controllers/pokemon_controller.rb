class Pokemonevolve < Sinatra::Base
  
  set :method_override, true

  # Variables for create method


  # RESTful Artist Controller Actions
  # index
  get '/pokemon' do
    @pokemon = Pokemon.all
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
    redirect to('/pokemon/new')

        # other method  (Don't forget -1 pokemon +1 candy)
        # Candy/Evolve cost = initial evolve
        # Candy - (initial evolve * evolve cost) = remander
        # ((remander + #of pokemon)/evolve cost) = extra evolves
        # extra evolves + initial evolve = total
  end

  # show
  get '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    erb(:"pokemon/show")
  end

  # edit
  get '/pokemon/:id/edit' do
    @pokemon = Pokemon.find(params[:id])
    erb(:"pokemon/edit")
  end

  # update
  put '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update_attributes(params[:pokemon])
      redirect("/pokemon/#{@pokemon.id}")
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
