# index
get "/questions/:id/comments" do
  redirect "questions/#{params[:id]}"
end


# get new comment
get "/questions/:id/comments/new" do
  @question = Question.find_by_id(params[:id])

  if request.xhr?
    erb :"comments/_newform", layout: false, locals: { question: @question }
  else
    erb :"comments/new"
  end
end

# post a new comment
post "/questions/:id/comments" do
  @question = Question.find_by_id(params[:id])
  @comment = @question.comments.new(comment: params[:comment],
                            user_id: current_user.id)

  if request.xhr? && @comment.save
    # send back just one comment data
    erb :"comments/show", layout: false, locals: { question: @question, comment: @comment }
  elsif @comment.save

  end

  # if @comment.save
  #   redirect "questions/#{@question.id}"
  # else
  #   @errors = @comment.errors.full_messages
  #   erb :"comments/new"
  # end
end

# show
get "/questions/:q_id/comments/:id" do
  redirect "questions/#{params[:q_id]}"
end

# get edit form
get "/questions/:q_id/comments/:id/edit" do
  @question = Question.find_by_id(params[:q_id])
  @comment = Comment.find_by_id(params[:id])

  erb :"comments/edit"
end

# Update comment
put "/questions/:q_id/comments/:id" do
  @question = Question.find_by_id(params[:q_id])
  @comment = Comment.find_by_id(params[:id])

  if @comment.update(comment: params[:comment])
    redirect "questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :"comments/edit"
  end
end

# Delete comment
delete "/questions/:q_id/comments/:id" do
  Comment.find_by_id(params[:id]).destroy

  redirect "questions/#{params[:q_id]}"
end
