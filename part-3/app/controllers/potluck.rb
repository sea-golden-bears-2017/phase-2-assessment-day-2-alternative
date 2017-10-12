get '/potluck/new' do
  erb :'/potlucks/new'
end

post '/potluck' do
  @potluck = Potluck.new(params[:potluck])
  params[:datetime].split(' ')
  date_at = params[:datetime].split(' ')[0]
  time_at = params[:datetime].split(' ')[1]
  # p "*" * 100
  # p date
  @potluck.date_at = date_at
  @potluck.time_at = time_at
  @potluck.save!
  redirect "/potluck/#{@potluck.id}"
end

get '/potluck' do
  @potlucks = Potluck.all
  erb :'/potlucks/index'
end

get '/potluck/:id' do
  @potluck = params[:id]
  erb :'/potlucks/show'
end
