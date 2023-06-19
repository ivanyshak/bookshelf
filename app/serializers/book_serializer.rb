# frozen_string_literal: true

class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :genre, :author
end
