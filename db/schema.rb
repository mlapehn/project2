
ActiveRecord::Schema.define(version: 20150710192918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemon", force: :cascade do |t|
    t.string   "name"
    t.string   "Number of Candies"
  end

end