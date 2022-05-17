
# frozen_string_literal: true

class RemoveRepositorieToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :repositories
  end
end