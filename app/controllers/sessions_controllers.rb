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
		redirect "/sessions/#{session[:id]}/dashboard"
	 else
		 redirect '/'
	end
end

#redirect from /sessions for id, user dashboard
get '/sessions/:id/dashboard' do
erb :"sessions/dashboard"
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
