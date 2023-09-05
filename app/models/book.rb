# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_authors, dependent: :nullify
  has_many :authors, through: :book_authors
  has_many :book_genres, dependent: :nullify
  has_many :genres, through: :book_genres
  validates :title, presence: true

  scope :by_query, lambda { |query|
    where(query_search_sql, query) if query.present?
  }

  scope :by_genre, ->(query) { joins(:genres).where(genres: { name: query }) if query.present? }

  def self.search(params)
    super(params)
      .by_query(params[:query])
      .by_genre(params[:genre])
  end

  def self.query_search_sql
    "CONCAT(title.first_name) ILIKE CONCAT('%',?,'%')"
  end
end
