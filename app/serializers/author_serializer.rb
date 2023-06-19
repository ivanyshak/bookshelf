# frozen_string_literal: true

class AuthorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :date_of_birth, :bio
  attributes :books
end
