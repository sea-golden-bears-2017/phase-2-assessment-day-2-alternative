get '/potluck/new' do
  @user = User.find(session[:user_id]).username
  erb :'/potlucks/new'
end

post '/potluck' do
  @potluck = Potluck.new(params[:potluck])
  params[:datetime].split(' ')
  date_at = params[:datetime].split(' ')[0]
  time_at = params[:datetime].split(' ')[1]
  @potluck.date_at = date_at
  @potluck.time_at = time_at
  if @potluck.name == "" || @potluck.location == "" || @potluck.date_at == "" || @potluck.time_at == "" || @potluck.user_id == nil
    @error = "All fields must be filled out to create a potluck."
    erb :'/potlucks/new'
  else
    @potluck.save!
    redirect "/potluck/#{@potluck.id}"
  end
end

get '/potluck' do
  @potlucks = Potluck.all
  erb :'/potlucks/index'
end

get '/potluck/:id' do
  @potluck = Potluck.find(params[:id])
  p "8" * 100
  p @potluck
  erb :'/potlucks/show'
end
