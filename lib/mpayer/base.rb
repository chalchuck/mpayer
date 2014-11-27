require 'httparty'
require "wsse"
require "pry"

module Mpayer
  class Base
  	include HTTParty
    @@base_uri "https://app.mpayer.co.ke/api"

    def initialize(user_no, token)
      @user_no = user_no
      @token   = token
      @auth    = WSSE::header(@user_no, @token)
      @header  = {'Content-Type'=> 'application/json', 'Accept' => 'application/json', 'X-WSSE' => "#{@auth}" }
    end

    def login(username, password)
      login_url = "#{@@base_uri}/login"
      json_msg  = { user: username, password: password }
      HTTParty.post(login_url.to_str, body: json_msg.to_json, headers: @header)
    end
  end
end