# index
get "/questions/:id/comments" do
  redirect "questions/#{params[:id]}"
end


# get new comment
get "/questions/:id/comments/new" do
  @question = Question.find_by_id(params[:id])

  erb :"comments/new"
end

# post a new comment
post "/questions/:id/comments" do
  @question = Question.find_by_id(params[:id])
  @question.comments.create(comment: params[:comment],
                            user_id: current_user.id)

  redirect "questions/#{@question.id}"
end

# show
get "/questions/:id/comments/:id" do
  redirect "questions/#{params[:id]}"
end

# get edit form
get "/questions/:id/comments/:id/edit" do

end

# Update comment
put "/questions/:id/comments/:id" do

end

# Delete comment
delete "/questions/:id/comments/:id" do

  redirect "questions/#{params[:id]}"
end
