require 'json'
require 'rest-client'

class LoginController < ApplicationController

  def index
  end

  def landing
    session[:procoreProjectId] = params[:procoreProjectId]
    session[:procoreCompanyId] = params[:procoreCompanyId]
  end

  def procore
    url = "#{ENV["OAUTH_DOMAIN"]}/oauth/authorize?response_type=code&client_id=#{ENV["CLIENT_ID"]}&redirect_uri=#{ENV["REDIRECT_URI"]}"

    redirect_to url
  end

  def callback
    @authorization_code = params["code"]

    request = {
      grant_type: "authorization_code",
      client_id: ENV["CLIENT_ID"],
      client_secret: ENV["CLIENT_SECRET"],
      code: @authorization_code,
      redirect_uri: ENV["REDIRECT_URI"]
    }

    response = RestClient.post("#{ENV["OAUTH_DOMAIN"]}/oauth/token", request.to_json, {content_type: :json, accept: :json})
    session[:oauth_response] = JSON.parse(response)
    puts session[:oauth_response]

    redirect_to root_path
  end
end
