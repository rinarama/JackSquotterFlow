get "/questions" do
  @questions = Question.all
  erb :"questions/index"
end

get "/questions/new" do
  require_user
  erb :"questions/new"
end

#post a new question
post "/questions" do
  require_user
  question = current_user.questions.new(params[:question])

  if question.save
    redirect "/questions"
  else
    @errors = question.errors.full_messages
    erb :"questions/new"
  end
end

#get one question record
get "/questions/:id" do
  @question = Question.find_by_id(params[:id])
  erb :"questions/show"
end

#edit a specific question record
get "/questions/:id/edit" do
  require_user
  @question = Question.find_by_id(params[:id])
  erb :"/questions/edit"
end

put "/questions/:id" do
  require_user
  @question = Question.find_by_id(params[:id])

  if  @question.update(params[:question])
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :"/questions/edit"
 end
end

#delete a specifc question record
delete "/questions/:id" do
  require_user
  Question.find_by_id(params[:id]).destroy

  redirect "/questions"
end
