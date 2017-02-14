enable :sessions

#login in render log in form
get '/sessions/new' do
	erb :"sessions/login"
end

#creating/finding new sessions for new user
post '/sessions' do
	current_user = User.find_by(email: params[:email])
	if current_user && current_user.authenticate(params[:password])
		session[:id] = current_user.id
		erb :"sessions/dashboard"
	 else
		 redirect '/'
	end
end


#logout
delete '/sessions/:id' do
	session.clear
	redirect '/sessions/new'
end

#authenticating already signed up user
# get '/sessions/dashboard' do
# 	authenticate_user!
# 	erb :'sessions/dashboard'
# end
