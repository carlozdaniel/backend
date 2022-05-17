# frozen_string_literal: true

class ApplicationController < ActionController::API
  def repos(user_params)
    "https://api.github.com/users/#{user_params}/repos"
  end

  def user_verification(user_params)
    connection.get("https://api.github.com/user?user=#{user_params}").body
  end

  private

  def connection
    Faraday.new do |f|
      f.request :authorization, 'Bearer', Figaro.env.GITHUB_TOKEN
      f.request :json # encode req bodies as JSON
      f.request :retry # retry transient failures
      f.response :follow_redirects # follow redirects
      f.response :json # decode response bodies as JSON
    end
  end
end
