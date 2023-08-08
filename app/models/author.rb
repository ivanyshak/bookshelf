# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :book_authors, dependent: :nullify
  has_many :books, through: :book_authors
  validates :first_name, :last_name, presence: true

  scope :by_query, lambda { |query|
    where(query_search_sql, query) if query.present?
  }

  def self.search(params)
    super(params)
      .by_query(params[:query])
  end

  def self.query_search_sql
    "CONCAT(authors.first_name, ' ', authors.last_name) ILIKE CONCAT('%',?,'%')"
  end
end
