enable :sessions

# index
get '/users' do
  @users = User.all
end

# show
get '/users/:id/profile' do
erb :"users/index"
end

# new sign up
get '/users/new' do
erb :"static/index"
end

# create sign up
post '/users' do
	user = User.new(params[:user])
  if user.save
    session[:id] = user.id
    # what should happen if the user is saved?
    redirect "/sessions/#{session[:id]}/dashboard"
  else
    # what should happen if the user keyed in invalid date?
    # @error message to appear
    redirect '/'
  end
end

# # edit
# post '/users/:id/edit' do
# 	erb :"/users/edit"
# end

# # update
# post '/users/:id' do
# 	redirect to '/users/:id'
# end
