get '/session/new' do
  erb :'/sessions/new'
end

post '/session' do
  player = Player.authenticate(params[:username], params[:password])
  if player # If authenticate returns a player
    session[:player_id] = player.id
    redirect '/'
  else # Else authenticate returns nil
    @error_messages = ['Login failed, please try again.']
    erb :'/sessions/new'
  end
end

delete '/session/:id' do
  session.clear
  redirect '/'
end
