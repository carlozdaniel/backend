# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repositories
  validates :name, presence: true
	validates :name, uniqueness: { case_sensitive: false }

  scope :find_user, ->(id) { all.find { |u| u.github_id == id } }
end
