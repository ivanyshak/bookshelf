# frozen_string_literal: true

describe Book do
  subject { build :book }

  it { should validate_presence_of(:title) }
end
