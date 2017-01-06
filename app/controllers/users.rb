get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/books'
  else
    erb :'/users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:user][:email])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/students'
  else
    erb :'users/login'
  end

end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/users/new'
end
