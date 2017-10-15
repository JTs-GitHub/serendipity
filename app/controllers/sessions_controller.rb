get '/sessions' do
  erb :'/sessions/index'
end

delete '/sessions' do
  session[:id]= nil
  redirect '/'
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by({email: params[:email]})
  if @user.password == params[:password]
    session[:id] = @user.id
    redirect '/sessions'
  else
    @errors = @user.errors.full_messages
    erb :'sessions/new'
  end
end
