# frozen_string_literal: true

require 'rails_helper'

describe Author do
  subject { build :author }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end
