class CreateUsers < ActiveRecord::Migration[5.1]
    def change
      create_table :users do |t|
        # t.[datatype] :column
        t.string :name
        # t.integer :id
      end
    end
  end