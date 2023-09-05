# frozen_string_literal: true

describe Genre, type: :model do
  subject { build :genre }

  it { should validate_presence_of(:name) }
end
