#Objective: Run these tests after the initial seed. This would be part of "regression suite"
# #TODO: Come up with a script that does a series of tasks for me. They could be:
# 1. Drop the test db (can I pick which?)
# 2. Run migrations
# 3. Seed the data
# 4. Run (this) initial tests

require_relative 'spec_helper'
require_relative '../config/environment'

describe Author do
    it "checks if the total number of authors in the table equals to the number of authors seeded" do  
      expect(Author.all.count).to eq(8)
    end
end

describe Category do
    it "checks if the total number of categories in the table equals to the number of categories seeded" do  
      expect(Category.all.count).to eq(4)
    end
end

describe Book do
    
    it "checks if the total number of books in the table equals to the number of books seeded" do  
      expect(Book.all.count).to eq(10)
    end

end

describe User do
    it "checks if the total number of users in the table equals to the number of users seeded" do  
      expect(User.all.count).to eq(20)
    end
end

describe Checkout do
    it "checks if the total number of checkouts in the table equals to the number of checkouts seeded" do  
      expect(Checkout.all.count).to eq(5)
    end
end