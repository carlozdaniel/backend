# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should validate_presence_of :id_repo }
end
