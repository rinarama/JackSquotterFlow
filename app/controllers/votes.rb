post '/questions/:question_id/upvote' do
  @question = Question.find(params[:question_id])
  @question.votes.update_or_create( user: current_user, vote_status: +1 )
    redirect "questions/#{@question.id}"
end

post '/questions/:question_id/downvote' do
  @question = Question.find(params[:question_id])
  @question.votes.update_or_create( user: current_user, vote_status: -1 )
    redirect "questions/#{@question.id}"
end

#find or initialize?
# http://apidock.com/rails/v4.0.2/ActiveRecord/Relation/find_or_initialize_by
#save if there is no user that already voted
