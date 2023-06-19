# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true

  enum genre: {
    classics: 'Classics',
    historical: 'Historical',
    action: 'Action',
    horror: 'Horror',
    fantasy: 'Fantasy',
    other: 'Other'
  }
end
