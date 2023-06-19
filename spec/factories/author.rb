# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    first_name { 'John' }
    last_name  { 'Doe' }
    bio { 'Some short info' }
    date_of_birth { Time.zone.today - 50.years }
  end
end
