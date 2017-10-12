get '/potluck/new' do
  # This applies to the /potluck route
  @user = User.find(session[:user_id])
  erb :'/potlucks/new'
end

post '/potluck' do
  # Could not get user using sessions, removed code from corresponding views to prevent errors, moving on to more releases. To fix this I would go change the user field in the migration of potluck to user_id so i could easily locate the user that way.
  @potluck = Potluck.new(params[:potluck])
  params[:datetime].split(' ')
  date_at = params[:datetime].split(' ')[0]
  time_at = params[:datetime].split(' ')[1]
  user = params[:user]
  @potluck.date_at = date_at
  @potluck.time_at = time_at
  @potluck.user = user
  # p "$" * 1000
  # p params[:user]
  if @potluck.name == "" || @potluck.location == "" || @potluck.date_at == "" || @potluck.time_at == ""
    @error = "All fields must be filled out to create a potluck."
    erb :'/potlucks/new'
  else
    @potluck.save!
    redirect "/potluck/#{@potluck.id}"
  end
end

get '/potluck' do
  erb :'/potlucks/index'
end

get '/potluck/:id' do
  @potluck = Potluck.find(params[:id])
  erb :'/potlucks/show'
end

put '/potluck/:id' do
  @potluck = Potluck.find(params[:id])
  @potluck.update(params[:potluck])
  @potluck.save!
  erb :"/potluck/show"
end

delete '/potluck/:id' do
  Potluck.delete(params[:id])
  @potlucks = Potluck.all
  erb :'/index'
end
