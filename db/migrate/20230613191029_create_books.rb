# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :genre, default: 'Other'
      t.references :author, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
