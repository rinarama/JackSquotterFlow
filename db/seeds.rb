# Create sample user
rina = User.create(username:"rina", email: "rina@test.com", password: "aaaaaa")

# Create sample questions
rina.questions.create([
  {
    title:   "ChuckNorris Fact Number 1",
    content: Faker::ChuckNorris.fact
  },
  {
    title:   "ChuckNorris Fact Number 2",
    content: Faker::ChuckNorris.fact
  }])
