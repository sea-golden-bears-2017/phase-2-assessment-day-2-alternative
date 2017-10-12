get '/session/new' do
  erb :'/sessions/new'
end

post '/session' do
  user = User.authenticate(params[:username], params[:password])
  if user # If authenticate returns a user
    session[:user_id] = user.id
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
