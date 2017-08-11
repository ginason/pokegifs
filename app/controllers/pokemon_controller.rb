class PokemonController < ApplicationController
def index

end

def show

    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    id  = body["id"]
    name  = body["name"]
    types  = body["types"]
    type_array = []
    types.each do |type|
      type_array << type["type"]["name"]
    end

    res = HTTParty.get("http://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{name}&rating=g")
    body = JSON.parse(res.body)
    gif_url = body["data"][0]["url"]

    render json: {"id": id, "name": name, "types": type_array, "git": gif_url}
  end
end
