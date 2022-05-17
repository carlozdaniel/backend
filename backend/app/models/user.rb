# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repositories

  scope :find_user, ->(id) { all.find { |u| u.github_id == id } }
end
