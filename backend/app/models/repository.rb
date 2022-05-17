class Repository < ApplicationRecord
  searchkick
  belongs_to :user
end
