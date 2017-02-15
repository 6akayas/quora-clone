enable :sessions

#index
get '/users/questions' do
    @questions = Question.all
    erb :"questions/question_index"
end

#show only users questions
get '/users/:id/questions/:id/show' do
  @questions = Question.all
  @question = Question.find_by(id: params[:id])
    erb :"questions/each_question"
end

###############################################################

# # # redirection for new question
# post '/users/questions/:id/new1' do
#     redirect "/users/questions/#{session[:id]}/new"
# end

# #new question
get '/users/questions/:id/new' do
    # @questions = Question.find_by(id: params[:id])
erb :"questions/question_index"
end

#create
post '/users/questions' do
    @questions = current_user.questions.new(title: params[:q_title], body: params[:question_content])
    # @questions = Question.new(params[:question])
    if @questions.save
        # session[:id] = user.id
        redirect '/users/questions'
        #   #redirects to show only users question erb
    else
        @error = "Invalid question format"
        redirect '/'
    end
end

################################################################

#edit
# get '/users/:id/questions/edit' do
#     # erb : edit page
# end
#
# #update
# post '/users/:id/questions' do
#     redirect to '/users/questions'
# end

#delete
