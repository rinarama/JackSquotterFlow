def current_user
  @user ||= User.find_by(id: session[:user_id])
end

def require_user
  redirect '/users/new' unless current_user
end
