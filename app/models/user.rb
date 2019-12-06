class User < ActiveRecord::Base
    has_many :checkouts
    has_many :books, through: :checkouts
    attr_accessor :returned

    def check_out_book(book,due_date)
        checkout_record = Checkout.create(returned:false,due_date:due_date)
        checkout_record.user_id = self.id
        checkout_record.book_id = book.id
        checkout_record.save
        checkout_record
    end

    def return_book(book)
        # checkout_record = Checkout.where(user_id:self.id).where(book_id:book.id)
        checkout_record = self.checkouts.find_by(book_id:book.id)
        checkout_record.returned = true
        checkout_record.save
        checkout_record
    end
end