before "/answers/*" do
  require_user
end

# "/questions/:id/comments"
# redirect "/questions/#{params[:id]}"
# "/questions/:id/answers/:id/comments"

get "/questions/:id/answers" do
  @answers = Answer.all
  erb :"answers/"
end

get "/answers/new" do
  # if request.xhr?
  #   erb :'answers/new', layout: false
  # else
    erb :"answers/new"
  # end
end

post "/answers" do
  answer = Answer.new(params)
  if answer.save
    # if request.xhr?
    #   erb :'answers/_one_answer', layout: false, locals:{one_answer: answer}
    # else
      redirect "/questions/#{params[:id]}"
    # end
  else
    @errors = answer.errors.full_messages
    erb :"answers/new"
  end
end

get "/questions/:id/answers" do
  @answer = Answer.find_by_id(params[:id])
  erb :"answers/show"
end

get "/answers/:id/edit" do
  @answer = Answer.find_by_id(id: params[:id])
  erb :"/answers/edit"
end

put "/answers/:id" do
  @answer = Answer.find_by_id(params[:id])
  if @answer.update(params[:answer])
    redirect "/answers/#{@answer.id}"
  else
    @errors = @answer.errors.full_messages
    erb :"/answers/edit"
  end
end

delete "/answers/:id" do
  Answer.find_by_id(params[:id]).destroy
  redirect "/answers"
end
