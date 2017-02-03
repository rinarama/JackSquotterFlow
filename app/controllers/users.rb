get '/users' do
  redirect '/'
end

get '/users/new' do
  if request.xhr?
    erb :'partials/_register', layout: false
  else
    erb :'users/new'
  end
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
  if request.xhr?
    erb :'partials/_login', layout: false
  else
    erb :'users/login'
  end
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
