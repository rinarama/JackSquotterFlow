#show all questions
get "/questions" do
  @questions = Question.all
  erb :"questions/index"
end

#get one question record
get "/questions/:id" do
  @question = Question.find_by_id(params[:id])
  erb :"questions/show"
end
#get the form for a new question
#post a new question
#edit a specific question record
#delete a specifc question record
