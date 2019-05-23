require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end

    post "/team" do
      @team = Team.new(params["team"].reject { |k, v| k == "members" })
      @heroes = []

      params["team"]["members"].each do |hero_hash|
        @heroes << Hero.new(hero_hash)
      end
      binding.pry
    end


end
