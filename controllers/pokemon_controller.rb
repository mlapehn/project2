class Pokemon < Sinatra::Base
  
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
