













#users
User.create(username: "rina", email: "rina@test.com", password: "p@55w0rd1")
User.create(username: "leila", email: "leilaa@test.com", password: "p@55w0rd2")
User.create(username: "kendy", email: "kendy@test.com", password: "p@55w0rd3")

#questions
Question.create(title:"Meta", content: "What am I?", user_id: 1)
Question.create(title:"Dreams", content: "Do I dream?", user_id:2)
Question.create(title:"Friends", content: "Are we friends?", user_id:3)

#answers
Answer.create(answer:"Robots can't have friends.", question_id: 3, user_id: 1)
Answer.create(answer:"You're a cornball.", question_id: 1, user_id: 2)
Answer.create(answer:"No you just beep boop beep.", question_id: 2, user_id: 3)

#comments
# Comment.create(comment:"What kind of question is that?", commentable_id: {question_id: 3} ,commentable_type: "Question", user_id:1)
# Comment.create(comment:"Nuh uh, they can dream", commentable_id: {answer_id: 3} ,commentable_type: "Answer", user_id:2)
# Comment.create(comment:"It's just, like, a regular question, whatever.", commentable_id: {comment_id: 1} ,commentable_type: "Comment", user_id: 3)
