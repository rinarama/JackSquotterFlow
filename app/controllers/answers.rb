before "/answers/*" do
  require_user
end
#all answers per question
get "/questions/:id/answers" do
  @answers = @questions.answers
  erb :"answers/", :locals => {:answer => params[:answer]}
end
#get the new answer form
get "/questions/:id/answers/new" do
  @question = Question.find_by_id(params[:id])
  if request.xhr?
    erb :"partials/_one_answer", layout: false, locals: { question: @question }
  else
    erb :"answers/new"
  end
end
#post a new answer
post "/questions/:question_id/answers" do
  @question = Question.find_by(id: params[:question_id])
  @answer = @question.answers.new(answer: params[:answer], user_id: current_user.id)
    if request.xhr? && @answer.save
      erb :'answers/show', layout: false, locals: { question: @question, comment: @answer }
    elsif @answer.save
        redirect "/questions/#{@question.id}"
    else
      @errors = @answer.errors.full_messages
      erb :"answers/new"
    end
end
#show the single answer
get "/questions/:id/answers" do
  @answer = Answer.find_by_id(params[:id])
  erb :"answers/show"
end
#show the edit answer form
get "/questions/:question_id/answers/:id/edit" do
  @question = Question.find_by_id(params[:question_id])
  @answer = Answer.find_by_id(params[:id])
  if request.xhr?
    erb :"partials/_edit_answer", layout: false, locals: { question: @question, answer: @answer }
  else
    erb :"answers/edit"
  end
end
#edit/update your answer
put "/questions/:question_id/answers/:id" do
  @question = Question.find_by_id(params[:question_id])
  @answer = @question.answers.find_by(id: params[:id])
    edit = @answer.update(params[:answer])

  if request.xhr? && edit
    date = date_converter(@answer.created_at, @answer.updated_at, false)
    content_type :json
    { id: @answer.id, answer: @answer.answer, date: date }.to_json
  elsif edit
      redirect "/questions/#{params[:question_id]}"
  else
      @errors = @answer.errors.full_messages
      erb :"/answers/edit"
  end
end
#delete your answer
delete "/questions/:question_id/answers/:id" do
  Answer.find_by_id(params[:id]).destroy
  if request.xhr?
    content_type :json
    { id: params[:id] }.to_json
  else
  redirect "/questions/#{params[:question_id]}"
  end
end
