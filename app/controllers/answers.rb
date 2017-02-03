before "/answers/*" do
  require_user
end

#show all answsers
#get one question record
#get the form for a new question
#post a new question
#edit a specific question record
#delete a specifc question re cord
get '/answers' do
  @answers = Answer.all
  erb :'answers/index'
end

get '/answers/new' do
  # if request.xhr?
  #   erb :'answers/new', layout: false
  # else
    erb :'answers/new'
  # end
end

post '/answers' do
  answer = Answer.new(params)
  if answer.save
    # if request.xhr?
    #   erb :'answers/_one_answer', layout: false, locals:{one_answer: answer}
    # else
      redirect '/answers'
    # end
  else
    @errors = answer.errors.full_messages
    erb :'answers/new'
  end
end

get '/answers/:id'
  @answer = Answer.find(params[:id])
  erb :'answers/show'
end

get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'/answers/edit'
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
    redirect "/answers/#{@answer.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/edit'
  end
end

delete '/answers/:id' do

end
