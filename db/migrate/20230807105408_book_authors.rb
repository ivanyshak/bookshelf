# frozen_string_literal: true

class BookAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :book_authors do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
