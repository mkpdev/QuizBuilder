# frozen_string_literal: true

u1 = User.create(name: 'Joe Bloggs', role: :admin, email: 'joe@yopmail.com', password: '123456')
u2 = User.create(name: 'Jane Doe', role: :user, email: 'jane@yopmail.com', password: '123456')

q = Quiz.create(name: 'Quiz 1', user_id: u1.id)
qu1 = Question.create(title: 'How tall are you?', quiz_id: q.id)
qu2 = Question.create(title: 'How much do you weigh?', quiz_id: q.id)

Answer.create(response: '180cm', question_id: qu1.id, user_id: u2.id, quiz_id: q.id)