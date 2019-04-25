require 'json'
require 'rest-client'

class LoginController < ApplicationController

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
