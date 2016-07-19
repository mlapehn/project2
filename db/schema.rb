ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

    create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "candy"
    t.string "evolve"
    s.string "pokemoncount"
  end

end
