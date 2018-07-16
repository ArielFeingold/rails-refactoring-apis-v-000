require 'pry'
class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    githubservice = GithubService.new
    session[:token] = githubservice.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params["code"])
    redirect_to '/'
  end
end
