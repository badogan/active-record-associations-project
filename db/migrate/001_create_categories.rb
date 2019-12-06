class CreateCategories < ActiveRecord::Migration[5.1]
    def change
      create_table :categories do |t|
        # t.[datatype] :column
        t.string :name
        # t.integer :id
      end
    end
  end