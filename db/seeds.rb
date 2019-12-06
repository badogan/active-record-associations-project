puts 'starting'

8.times do
    Author.create(name: Faker::Name.first_name)
    # User.create(name: Faker::Name.first_name, surname: Faker::Name.last_name, height: Faker::Number.between(from: 140, to: 190), :weight => Faker::Number.between(from: 50, to: 100), :age => Faker::Number.between(from: 18, to: 100), :gender => Faker::Gender.binary_type)
end

4.times do
    Category.create(name: Faker::Book.genre)
    # User.create(name: Faker::Name.first_name, surname: Faker::Name.last_name, height: Faker::Number.between(from: 140, to: 190), :weight => Faker::Number.between(from: 50, to: 100), :age => Faker::Number.between(from: 18, to: 100), :gender => Faker::Gender.binary_type)
end

10.times do
    # Activity.create( :date => timestamp, :duration => Faker::Number.within(range: 1..60), :calories_burnt => Faker::Number.within(range: 1..500) ,user_id:User.all.sample.id, exercise_id: Exercise.all.sample.id)
    Book.create(title: Faker::Book.title,author_id:Author.all.sample.id, category_id:Category.all.sample.id)
end

20.times do
    # Activity.create( :date => timestamp, :duration => Faker::Number.within(range: 1..60), :calories_burnt => Faker::Number.within(range: 1..500) ,user_id:User.all.sample.id, exercise_id: Exercise.all.sample.id)
    User.create(name: Faker::Name.first_name)
end
5.times do
    Checkout.create(returned:false,due_date:"December 1st, 2019", user_id:User.all.sample.id,book_id:Book.all.sample.id)
end

puts 'finished'

# author1 = Author.create(:name=>"Author1")
# author2 = Author.create(:name=>"Author2")

# category1 = Category.create(name:"Children Books")
# category2 = Category.create(name:"Fiction")

# book1 = Book.create(:title=>"Title 1")
# book2 = Book.create(title:"Title 2")

# book1.author = author1
# book2.author = author2
# book1.category = category1
# book2.category = category2
# book1.save
# book2.save

# user1 = User.create(name:"Basri")
# user2 = User.create(name:"Arda")

# checkout1 = Checkout.create(returned:false,due_date:"December 1st, 2019")
# checkout2 = Checkout.create(returned:false,due_date:"December 1st, 2019")

# checkout1.user_id = user1.id
# checkout1.book_id = book1.id
# checkout1.save

# checkout2.user_id = user2.id
# checkout2.book_id = book2.id
# checkout2.save

# c={returned:false,due_date:"December 7st, 2019"}
# checkout3 = Checkout.create(c)
# checkout3.user_id = user1.id
# checkout3.book_id = user2.id
# checkout3.save
