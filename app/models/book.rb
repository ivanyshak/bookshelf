# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true

  scope :by_query, lambda { |query|
    where(query_search_sql, query) if query.present?
  }

  scope :by_genre, ->(query) { where(genre: query) if query.present? }

  enum genre: {
    classics: 'Classics',
    historical: 'Historical',
    action: 'Action',
    horror: 'Horror',
    fantasy: 'Fantasy',
    other: 'Other'
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
