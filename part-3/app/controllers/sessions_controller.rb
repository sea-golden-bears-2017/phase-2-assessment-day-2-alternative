get "/sessions/new" do
  erb :"sessions/new"
end

post "/sessions" do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:id] = @user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

delete "/sessions" do
  session.clear
  redirect '/'
end
