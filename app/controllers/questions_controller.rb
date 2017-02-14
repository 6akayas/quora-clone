enable :sessions

#index
get '/users/questions' do
  @questions = Question.all
  erb :"questions/index"
end

#show only users questions
get '/users/:id/questions/:id/show' do
  # erb :profile question page
end

#new
get '/users/:id/questions/new' do
  # erb : questions form
end

#create
post 'users/:id/questions' do
  q = User.questions.new()
  if q.save
    # erb : dashboard
  else
    #erb : question form again or error msg
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
