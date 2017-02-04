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
    redirect "questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages

    if request.xhr?
      status 422
      erb :"partials/_errors", locals: {errors: @errors}, layout: false
    else
      erb :"comments/new"
    end
  end

end

# show
get "/questions/:q_id/comments/:id" do
  redirect "questions/#{params[:q_id]}"
end

# get edit form
get "/questions/:q_id/comments/:id/edit" do
  @question = Question.find_by_id(params[:q_id])
  @comment = Comment.find_by_id(params[:id])

  if request.xhr?
    erb :"comments/_editform", layout: false, locals: { question: @question, comment: @comment }
  else
    erb :"comments/edit"
  end
end

# Update comment
put "/questions/:q_id/comments/:id" do
  @question = Question.find_by_id(params[:q_id])
  @comment = Comment.find_by_id(params[:id])

  update = @comment.update(comment: params[:comment])

  if request.xhr? && update
    date = date_converter(@comment.created_at, @comment.updated_at, false)
    content_type :json
    { id: @comment.id, comment: @comment.comment, date: date }.to_json
  elsif update
    redirect "questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages

    if request.xhr?
      status 422
      erb :"partials/_errors", locals: {errors: @errors}, layout: false
    else
    erb :"comments/edit"
    end
  end
end

# Delete comment
delete "/questions/:q_id/comments/:id" do
  Comment.find_by_id(params[:id]).destroy

  if request.xhr?
    content_type :json
    { id: params[:id] }.to_json
  else
    redirect "questions/#{params[:q_id]}"
  end
end
