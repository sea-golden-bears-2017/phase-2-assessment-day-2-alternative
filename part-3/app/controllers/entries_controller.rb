get '/entries' do
  @entries = Entry.all
  erb :'index'
end

post '/entries' do
  @entry = Entry.new(params[:entry])
  @user = User.find(session[:id])
  @user.entries << @entry
  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/new' do
  erb :'entries/new'
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  @comments = Comment.all
  erb :'entries/show'
end


put '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.assign_attributes(params[:entry])
  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/entries'
end

get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :'entries/edit'
end

#failed to impliment the comments/rsvp posts
post '/comment/new' do
  @comment = Comment.new(params[:comment])
  @entry = Entry.find(params[:id])
  if @comment.save
    @entry.comments << @comment
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/show'
  end
end
