get '/user/new' do
  erb :'/users/new'
end

post '/user' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.username == "" || @user.password == "" || @user.email == ""
    @error = "All fields must be filled out to register."
    erb :'/users/new'
  else
    @user.save!
    erb :'/sessions/new'
  end
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
