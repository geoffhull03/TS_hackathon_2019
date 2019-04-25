require 'json'
require 'rest-client'

class LoginController < ApplicationController

  def index
  end

  def landing
  end

  def procore
    url = "https://sandbox.procore.com/oauth/authorize?response_type=#{code}&client_id=#{ENV["CLIENT_ID"]}&redirect_uri=#{ENV["REDIRECT_URI"]}"

    redirect_to url
  end

  def callback
    @authorization_code = params["code"]

    request = {
      "grant_type" => "authorization_code",
      "client_id" => CLIENT_ID,
      "client_secret" => CLIENT_SECRET,
      "code" => @authorization_code,
      "redirect_uri" => REDIRECT_URI
    }

    response = RestClient.post(OAUTH_URL + '/oauth/token', request.to_json, {content_type: :json, accept: :json})
      session[:oauth_response] = JSON.parse(response)

  end
end
