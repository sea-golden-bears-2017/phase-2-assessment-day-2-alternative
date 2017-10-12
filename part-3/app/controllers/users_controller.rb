get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.save!
    redirect '/'
  else
    erb :"users/new"
  end
end
