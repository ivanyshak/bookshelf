# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::AuthorsController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it { should have_http_status(:success) }
  end

  describe 'GET #show' do
    subject { get :show }

    it { should have_http_status(:success) }
  end
end
