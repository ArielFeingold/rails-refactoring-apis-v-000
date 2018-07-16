require 'pry'
class RepositoriesController < ApplicationController
  def index
    githubservice = GithubService.new
    session[:username] = githubservice.get_username
    @repos_array = githubservice.get_repos
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
