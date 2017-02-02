#create a new users
rina = User.create(username:"rina", email: "rina@test.com", password: "aaaaaa")
#all users
User.all
#Create a question with current user_id
bob.questions.create(title:"Do", content: "Do I dream?")
bob.questions.count
#Create an answer
leila.answers.create(answer:"YES!", user_id:1)
#Create a comments
leila.comments.create(comment:"She is pretty dope", user_id:2)

leila.votes.create(vote_status: 1, user_id: 1)
