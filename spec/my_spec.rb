require_relative 'spec_helper'

# require "./app/models/factorial.rb"
require_relative '../config/environment'

#A couple of examples for basic use

describe Author do
  it "checks if multiple authors can be created." do  
    Author.create(name:"Basri_Random_Author_1")
    Author.create(name:"Basri_Random_Author_2")
    Author.create(name:"Basri_Random_Author_3")
    expect(Author.all.count).to eq(3)
  end

  let(:my_author) { Author.create(name:"Basri_Random_Author") }
  it "returns the newly created author name" do  
    expect(my_author.name).to eq("Fake_Basri_Random_Author")
  end

  it "checks if all authors have been added as intended" do  
    expect(Author.all.count).to eq(4)
  end
end

describe Category do
  it "checks if multiple categories can be created." do  
    Category.create(name:"Category_1")
    Category.create(name:"Category_2")
    Category.create(name:"Category_3")
    expect(Category.all.count).to eq(3)
  end

  let(:my_category) { Category.create(name:"Random_Category") }
  it "returns the newly created category name length is correct" do  
    expect(my_category.length).to eq(15)
  end

  it "checks if all categories have been added as intended" do  
    expect(Category.all.count).to eq(4)
  end

  it "can I test something not category here?" do
    expect(Author.all.count).to eq(4)
  end
end

describe Book do
  it "checks if multiple books can be created." do  
    Book.create(title:"Book_1")
    Book.create(title:"Book_2")
    Book.create(title:"Book_3")
    Author.create(name:"Malcolm Gladwell")
    expect(Book.all.count).to eq(3)
  end

  let(:my_book) { Book.create(title:"Random_Book") }
  it "returns the newly created book title is correct" do  
    expect(my_book.title).to eq("Random_Book")
  end

  it "checks if all books have been added as intended" do  
    expect(Book.all.count).to eq(4)
  end

  let(:my_author) { Author.find_by(name:"Malcolm Gladwell") }
  it "returns a book object with find_by" do  
    expect(my_author.name).to eq("Malcolm Gladwell")
  end

  it "checks if an author can be assigned to a book" do  
    my_book.author_id = my_author.id
    expect(my_book.author.name).to eq("Malcolm Gladwell")
  end

  it "can I test something not category here?" do
    expect(Author.all.count).to eq(4)
  end
end

###########################################

describe FunnyTest do
  it "adds 2 to whatever is provided" do
    calculator = FunnyTest.new
    expect(calculator.adds_two(4)).to eq(5)
  end
end

# Example for let
describe Factorial do
  let(:calculator) { Factorial.new }

  it "finds the factorial of 5" do  
    expect(calculator.factorial_of(5)).to eq(120)
  end

  it "finds the factorial of 3" do  
    expect(calculator.factorial_of(3)).to eq(12)
  end
end


#subject(:calculator) { Factorial.new }

#Good command: rspec ./spec/my_spec.rb -f d


#Good documentation: http://rspec.info/documentation/3.9/rspec-core/index.html