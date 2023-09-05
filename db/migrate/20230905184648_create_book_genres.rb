# frozen_string_literal: true

class CreateBookGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :book_genres do |t|
      t.integer :book_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
