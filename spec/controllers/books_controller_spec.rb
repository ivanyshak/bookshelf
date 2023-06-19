# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it { should have_http_status(:success) }
  end
end
