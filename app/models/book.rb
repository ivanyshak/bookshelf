# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_authors, dependent: :nullify
  has_many :authors, through: :book_authors
  validates :title, presence: true

  scope :by_query, lambda { |query|
    where(query_search_sql, query) if query.present?
  }

  scope :by_genre, ->(query) { where(genre: query) if query.present? }

  enum genre: {
    classics: 0,
    historical: 1,
    action: 2,
    horror: 3,
    fantasy: 4,
    other: 5
  }

  def self.search(params)
    super(params)
      .by_query(params[:query])
      .by_genre(params[:genre])
  end

  def self.query_search_sql
    "CONCAT(title.first_name) ILIKE CONCAT('%',?,'%')"
  end
end
