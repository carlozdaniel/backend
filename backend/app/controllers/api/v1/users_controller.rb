# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        @user = user_verification(user_params)
        db_user = User.find_user(@user['id'])
        db_user = User.create(user_connection) if db_user.blank?
        SearchWorker.perform_async(db_user.id, user_params)

        render json: db_user.as_json
      end

      private

      def user_connection
        { github_id: @user['id'], login: @user['login'], url: @user['html_url'], name: @user['name'],
          email: @user['email'], avatar_url: @user['avatar_url'] }
      end

      def user_params
        params.require(:username)
      end
    end
  end
end
