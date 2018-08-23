require 'sinatra'
require 'shotgun'
require_relative './lib/player'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    # session[:p1], session[:p2] = params[:p1_name], params[:p2_name]
    $p1 = Player.new(params[:p1_name])
    $p2 = Player.new(params[:p2_name])
    redirect '/play'
  end

  get '/play' do
    @p1 = $p1
    @p2 = $p2
    erb :play
  end

  get '/attack' do
    @p1 = $p1
    @p2 = $p2
    @p1.attack_player(@p2)
    erb :attack
  end

  # Required if running from command line (ruby app.rb) and not using 'rackup'
  run! if app_file == $0

end
