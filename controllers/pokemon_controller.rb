class Pokemonevolve < Sinatra::Base
  
  set :method_override, true

  # RESTful Artist Controller Actions
  # index
  get '/pokemon' do
    @pokemon = Pokemon.all
    erb(:"pokemon/index")
  end

  # new
  get '/pokemon/new' do
    @pokemon = Pokemon.new
    erb(:"pokemon/new")
  end

  # create
  post '/pokemon' do
    @pokemon = Pokemon.new(params[:pokemon])
    if @pokemon.save
      redirect("/pokemon/#{@pokemon.id}")
    else

      # can still evolve = candy left > evolve cost

      # while can still evolve 
        # evolve cost or= pass in cost
        # candy = candy - evolve cost
          # Some code goes here
        # evolve cost is = 12,25,50,100


        # other method  (Don't forget -1 pokemon +1 candy)
        # Candy/Evolve cost = initial evolve
        # Candy - (initial evolve * evolve cost) = remander
        # ((remander + #of pokemon)/evolve cost) = extra evolves
        # extra evolves + initial evolve = total

      erb(:"pokemon/new")
    end
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
