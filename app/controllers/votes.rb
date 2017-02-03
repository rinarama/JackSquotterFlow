post '/questions/:question_id/upvote' do
  @question = Question.find(params[:question_id])
  @question.votes.create( user: current_user, value_status: 1 )
    redirect "questions/#{@question.id}"
end

post '/questions/:question_id/downvote' do
  @question = Question.find(params[:question_id])
  @question.votes.create( user: current_user, value_status: -1 )
    redirect "questions/#{@question.id}"
end
