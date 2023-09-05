# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :book_genres, dependent: :nullify
  has_many :books, through: :book_genres

  GENRE_NAME = %w[classics historical action horror fantasy other].freeze

  validates :name, presence: true, inclusion: { in: GENRE_NAME }
end
