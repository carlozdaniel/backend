# frozen_string_literal: true

class Repository < ApplicationRecord
  searchkick
  validates :id_repo, presence: true
  belongs_to :user
end
