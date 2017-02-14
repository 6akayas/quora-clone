enable :sessions

# index
get '/users' do
  @users = User.all
end

# redirection for show
post '/users/:id' do
  redirect "/users/#{session[:id]}/profile"
end

# show
get '/users/:id/profile' do
  erb :"users/profile"
end

# new sign up
get '/users/new' do
	erb :'static/index'
end

# create
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


# delete
# delete '/users/:id' do
#   session[:id] = nil
#   erb :"sessions/temp"
# end
