# frozen_string_literal: true

module Api
  module V1
    class RepositoriesController < ApplicationController
      def index
        @user = user_verification(user_params)
        db_user = User.find_user(@user['id'])
        SearchWorker.perform_async(db_user.id, user['login'])

        render json: db_user.repositories
      end

      def search_repositories
        users = Repository.search(search_params)
        render json: users
      end

      private

      def save_repositories(id)
        @repos = connection.get(repos(user_params), { per_page: 100 }).body
        @repos.each do |repo|
          Repository.create!(repositorie: repo, user_id: id)
        end
      end

      def user_information
        { github_id: @user['id'], login: @user['login'], url: @user['html_url'], name: @user['name'],
          email: @user['email'], avatar_url: @user['avatar_url'] }
      end

      def user_params
        params.require(:user_id)
      end

      def search_params
        params.require(:search)
      end
    end
  end
end
