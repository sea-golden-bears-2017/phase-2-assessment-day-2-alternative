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

get '/potluck/:id/edit' do
  @potluck = Potluck.find(params[:id])
  erb :'/potlucks/edit'
end

put '/potluck/:id' do
  @potluck = Potluck.find(params[:id])
  @potluck.update(params[:potluck])
  params[:datetime].split(' ')
  date_at = params[:datetime].split(' ')[0]
  time_at = params[:datetime].split(' ')[1]
  @potluck.date_at = date_at
  @potluck.time_at = time_at
  if @potluck.name == "" || @potluck.location == "" || @potluck.date_at == "" || @potluck.time_at == ""
    @error = "All fields must be filled out to edit a potluck."
    # ERB is not setup correctly yet
    erb :"/potluck/@potluck.id/edit"
  else
    @potluck.save!
    redirect "/potluck/#{@potluck.id}"
  end
end

delete '/potluck/:id' do
  Potluck.delete(params[:id])
  redirect '/'
end
