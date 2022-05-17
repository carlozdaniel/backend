# frozen_string_literal: true

class Repository < ApplicationRecord
  searchkick
  belongs_to :user
end
