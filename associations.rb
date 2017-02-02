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

# Validation on-
# The :on option lets you specify when the validation should happen. The default behavior for all the built-in validation helpers is to be run on save (both when you're creating a new record and when you're updating it). If you want to change it, you can use on: :create to run the validation only when a new record is created or on: :update to run the validation only when a record is updated.
#
# class Person < ApplicationRecord
#   # it will be possible to update email with a duplicated value
#   validates :email, uniqueness: true, on: :create
#
#   # it will be possible to create the record with a non-numerical age
#   validates :age, numericality: true, on: :update
#  
#   # the default (validates on both create and update)
#   validates :name, presence: true
# end
