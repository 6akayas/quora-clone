enable :sessions

#index
post '/users/questions' do
  @questions = Question.all
  erb :"questions/index"
end

# redirection for show
post '/users/:id/questions/:id' do
  redirect "/users/#{session[:id]}/questions/#{session[:id]}/show"
end

#show only users questions
get '/users/:id/questions/:id/show' do
  erb :"questions/each_question"
end

# redirection for new question
post '/users/:id/questions/:id/new' do
  redirect "/users/#{session[:id]}/questions/new"
end

#new question
get '/users/:id/questions/new' do
  @questions = Question.find_by(id: params[:id])
  erb :"questions/each_question"
end

#create
post 'users/:id/questions' do
  @questions = current_user.questions.create(content: params[:question])
  if @questions.save
    redirect "/users/#{session[:id]}/questions/#{session[:id]}/show"
    #redirects to show only users question erb
  else
    @error = "Invalid question format"
    redirect "/users/#{session[:id]}/questions/new"
  end
end

#edit
get '/users/:id/questions/edit' do
  # erb : edit page
end

#update
post '/users/:id/questions' do
	redirect to '/users/questions'
end

#delete
delete '/users/:id/questions' do
  question.delete
  erb :"sessions/temp"
end
