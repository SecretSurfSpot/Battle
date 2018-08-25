require 'sinatra/base'
require 'shotgun'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    # session[:p1], session[:p2] = params[:p1_name], params[:p2_name]
    # $p1 = Player.new(params[:p1_name])
    # $p2 = Player.new(params[:p2_name])
    p1 = Player.new(params[:p1_name])
    p2 = Player.new(params[:p2_name])
    $game = Game.new(p1, p2)
    redirect '/play'
  end

  get '/play' do
    # @p1_name = $p1.name
    # @p2_name = $p2.name
    # @p2_hit_points = $p2.hit_points
    @game = $game
    erb :play
  end

  get '/attack' do
    # @p1 = $p1
    # @p2 = $p2
    # @p1_name = $p1.name
    # @p2_name = $p2.name
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turns
    erb :attack
  end

  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
