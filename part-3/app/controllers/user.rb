get '/user/new' do
  erb :'/users/new'
end

post '/user' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
  erb :'/sessions/new'
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
