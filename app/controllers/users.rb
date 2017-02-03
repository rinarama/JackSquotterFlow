get '/users' do
  redirect '/'
end


get '/users/new' do
    erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/login' do
    erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = ["Invalid username or password"]
    erb :'users/login'
  end
end

get '/users/:id' do
  require_user
  @user = current_user
  erb :'users/show'
end

get '/logout' do
  require_user
  session[:user_id] = nil
  redirect '/'
end
