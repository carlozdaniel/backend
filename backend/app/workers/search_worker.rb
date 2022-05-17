# frozen_string_literal: true

class SearchWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1

  def perform(id, user_params = nil)
    @id = id
    @user_params = user_params
    save_repositories
  end

  def save_repositories
    @repos = connection.get(repos, { per_page: 100 }).body
    @repos.each do |repo|
      repo_id = repo['id']
      unless Repository.find_by_id_repo(repo_id)
        Repository.create!(repositorie: repo, user_id: @id, id_repo: repo_id)
      end
    end
  end

  private

  def repos
    "https://api.github.com/users/#{@user_params}/repos"
  end

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
