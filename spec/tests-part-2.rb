#Objective: Run these tests after the initial seed. This would be part of "regression suite"
# #TODO: Come up with a script that does a series of tasks for me. They could be:
# 1. Drop the test db (can I pick which?)
# 2. Run migrations
# 3. Seed the data
# 4. Run (this) initial tests

# Known Bugs: 
# 1. Please see Readme

require_relative 'spec_helper'
require_relative '../config/environment'

describe Author do
    it "new author can be added" do
      Author.destroy(Author.find_or_create_by(name:"Basri Dummy").id)
      Author.create(name:"Basri Dummy")
      expect(Author.find_by(name:"Basri Dummy").name).to eq("Basri Dummy")
    end

    # TODO: Create a test so that an author can be deleted
end

describe Category do
    it "new category can be added" do
      Category.destroy(Category.find_or_create_by(name:"Dummy Category").id)
      Category.create(name:"Dummy Category")
      expect(Category.find_by(name:"Dummy Category").name).to eq("Dummy Category")
    end 

    # TODO: Create a test so that a category can be deleted
end

describe Book do

  # TODO: Create a test so that a book can be deleted

    let(:my_book) { Book.find_or_create_by(title:"Favelas R Us")}
    it "new book created and author and category assigned to the book" do
      Book.destroy(my_book.id)
      my_book = Book.create(title:"Favelas R Us")
      my_book.author_id = nil
      my_book.category_id = nil
      Author.destroy(Author.find_or_create_by(name:"Basri").id)
      Author.create(name:"Basri")
      Category.destroy(Category.find_or_create_by(name:"Rio Category").id)
      Category.create(name:"Rio Category")
      my_book.author_id = Author.find_by(name:"Basri").id
      my_book.category_id = Category.find_by(name:"Rio Category").id
      my_book.save
      expect(Book.find_by(id:my_book.id).author.name).to eq("Basri")
      expect(Book.find_by(id:my_book.id).category.name).to eq("Rio Category")
    end
end

describe User do

  # TODO: Create a test so that a user can be deleted

  it "new user can be added" do
    User.destroy(User.find_or_create_by(name:"Library User").id)
    User.create(name:"Library User")
    expect(User.find_by(name:"Library User").name).to eq("Library User")
  end
  
  let(:my_user) { User.find_by(name:"Library User")}
  it "user can check out a book from library" do
    book = Book.find_by(title:"Favelas R Us")
    due_date = "December 7st, 2019"
    my_user.check_out_book(book,due_date)
    expect(Checkout.find_by(book_id:book.id).book.author.name).to eq("Basri")
    expect(Checkout.find_by(book_id:book.id).returned).to eq(false)
  end

  it "user can return book to library" do
    book = Book.find_by(title:"Favelas R Us")
    my_user.return_book(book)
    expect(Checkout.find_by(book_id:book.id).returned).to eq(true)
  end

  it "clean up checkout table so that no entry related with test user is left" do
     Checkout.where(user_id:User.find_by(name:"Library User").id).each{|c|Checkout.destroy(c.id)}
     expect(Checkout.where(user_id:User.find_by(name:"Library User")).length).to eq(0)
  end
  
  it "clean up checkout table so that no entry related with test book is left" do
    Checkout.where(book_id:Book.find_by(title:"Favelas R Us").id).each{|c|Checkout.destroy(c.id)}
    expect(Checkout.where(book_id:Book.find_by(title:"Favelas R Us")).length).to eq(0)
  end

end