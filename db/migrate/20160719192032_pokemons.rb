class Pokemons < ActiveRecord::Migration
  def change
  	create_table :pokemons do |t|
  		t.string "name"
  		t.integer "candy"
  		t.integer "evolve"
  		t.integer "pokemoncount"
  		end
  end
end
