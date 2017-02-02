#show all questions
get "/questions" do
  @questions = Question.all
  erb :"questions/index"
end
#get one question record
#get the form for a new question
#post a new question
#edit a specific question record
#delete a specifc question record
