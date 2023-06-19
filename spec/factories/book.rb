# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Test title' }
    description { 'Description' }
    genre { 'classics' }
  end
end
