get '/' do
  @potlucks = Potluck.all
  erb :'/index'
end
