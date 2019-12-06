class CreateAuthors < ActiveRecord::Migration[5.1]
    def change
      create_table :authors do |t|
        # t.[datatype] :column
        t.string :name
        # t.integer :id
      end
    end
  end