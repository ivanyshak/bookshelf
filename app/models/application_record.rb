# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  DEFAULT_PER_VALUE = 10

  scope :by_id, ->(id) { where(table_name => { id: id }) if id.present? }

  def self.search(params)
    by_id(params[:id])
  end

  def self.paginate(params)
    page(params[:page] || 1)
      .per(params[:per] || DEFAULT_PER_VALUE)
  end
end
