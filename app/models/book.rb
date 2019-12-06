class Book < ActiveRecord::Base
    belongs_to :author
    belongs_to :category
    
    # belongs_to :checkout
    has_many :checkouts
    has_many :users, through: :checkouts
end