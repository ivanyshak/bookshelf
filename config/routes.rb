# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: %w[index show create update destroy]
      resources :authors, only: %w[index show create update destroy]
    end
  end
end
