# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.text :bio

      t.timestamps
    end
  end
end
