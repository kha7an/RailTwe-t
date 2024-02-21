# тут будет возвращать колличество постов по заданнм датам JSON


class Api::V1::ReportsController < ApplicationController
  before_action :authenticate_token

  def index
    start_date = params[:start_date] || Date.current
    end_date = params[:end_date] || Date.current
    posts = Post.where("created_at > ? and created_at < ?", start_date, end_date)
    posts.to_json
  end

  private
  def authenticate_token
    if params[:key] == 'true_key'
      return true
    else
      "SKIP this"
      422
    end
  end

end