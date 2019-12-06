class CreateCheckouts < ActiveRecord::Migration[5.1]
    def change
      create_table :checkouts do |t|
        # t.[datatype] :column
        t.integer   :user_id
        t.integer   :book_id
        t.boolean   :returned
        t.datetime  :due_date
      end
    end
  end