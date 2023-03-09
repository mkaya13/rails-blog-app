# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg', bio: 'Teacher from Mexico.', email:'tom@hotmail.com', password: "asdf21asAB")
second_user = User.create(name: 'Lilly', photo: 'https://img.freepik.com/premium-vector/portrait-caucasian-woman-avatar-female-person-vector-icon-adult-flat-style-headshot_605517-26.jpg?w=2000', bio: 'Teacher from Poland.', email:"lilly@hotmail.com", password: "21asdf21AS")

puts first_user

first_post = Post.create(user_id: first_user.id, title: 'Case Study', text: 'asdfsafsa')
second_post = Post.create(user: first_user, title: 'Sun', text: 'asdfsafsa')
third_post = Post.create(user: second_user, title: 'Moon', text: 'asdfasfsafsa')
forth_post = Post.create(user: second_user, title: 'Glass', text: 'asdfasfashkfasbfhksa')

Comment.create(post: first_post, user: first_user, text: 'Hi Tom!' )
Comment.create(post: second_post, user: first_user, text: 'Wassup!' )
Comment.create(post: third_post, user: second_user, text: 'Nice one!' )
Comment.create(post: forth_post, user: second_user, text: 'Keep up the good work!' )



