require 'sinatra/base'
require 'shotgun'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    p1 = Player.new(params[:p1_name])
    p2 = Player.new(params[:p2_name])
    $game = Game.new(p1, p2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn))
    erb :attack
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect('/play')
  end

  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
