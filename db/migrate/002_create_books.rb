class CreateBooks < ActiveRecord::Migration[5.1]
    def change
      create_table :books do |t|
        # t.[datatype] :column
        t.integer   :author_id
        t.integer   :category_id
        t.string    :title
        # t.integer :id
      end
    end
end