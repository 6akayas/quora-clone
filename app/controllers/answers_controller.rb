enable :sessions

#index
get '/questions/:id/answers/new' do
  @answers = Answer.all
  @question = Question.find_by(id: params[:id])
  erb :"questions/each_question"
end

#create
post '/questions/:id/answers' do
    @question = Question.find_by(id: params[:id])
    @answers = Answer.all
    @answer = @question.answers.create(title: params[:a_title], body: params[:answer_content], user_id: session[:id], question_id: params[:id])
    redirect "/questions/#{params[:id]}/answers/new"
end

#delete
