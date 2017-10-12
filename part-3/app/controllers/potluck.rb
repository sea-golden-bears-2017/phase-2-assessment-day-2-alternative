get '/potluck/new' do
  erb :'/potlucks/new'
end

post '/potluck' do
  @potluck = Potluck.new(params[:potluck])
  params[:datetime].split(' ')
  date = params[:datetime].split(' ')[0]
  time = params[:datetime].split(' ')[1]
  # p "*" * 100
  # p date
  @potluck.date = date
  @potluck.time = time
  @potluck.save!
  redirect "/potluck/#{@potluck.id}"
end

get '/potluck/:id' do
  @potluck = params[:id]
  erb :'/potlucks/show'
end
