require "sinatra"
require "net/http"
require "uri"
require "json"

get "/receive" do
  pokemon = get_pokemon(params["keyword"])
  name = pokemon["name"].capitalize
  types = pokemon["types"].map{ |type| type["type"]["name"].capitalize }.join(" / ")
  stats = pokemon["stats"].map{ |stat| "#{stat["stat"]["name"].capitalize}: #{stat["base_stat"]}" }.join("\n")

  uri = URI.parse("https://rest.nexmo.com/sms/json")
  nexmo_params = {
      "api_key" => ENV["API_KEY"],
      "api_secret" => ENV["API_SECRET"],
      "to" => params["msisdn"],
      "from" => "447520635487",
      "text" => [
        name,
        types,
        stats
      ].join("\n")
  }

  Net::HTTP.post_form(uri, nexmo_params)
end

def get_pokemon(name)
  uri = URI.parse("http://pokeapi.co/api/v2/pokemon/#{name.downcase}/")
  JSON.parse(Net::HTTP.get(uri))
end

