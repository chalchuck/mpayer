require 'httparty'
require "wsse"
require "pry"

module Mpayer
	class MpayerSms
		include HTTParty
		@@base_uri = "https://app.mpayer.co.ke/api"

		def initialize(user_no, token)
		  @user_no = user_no
		  @token   = token
		  @auth    = WSSE::header(@user_no, @token)
		  @header  = {'Content-Type'=> 'application/json', 'Accept' => 'application/json', 'X-WSSE' => "#{@auth}" }
		end

		def send_message(json_msg)
	    @send_message_link = "#{@@base_uri}/messages"
	    HTTParty.post(
	    		@send_message_link.to_str, body: json_msg.to_json, headers: @header)
	  end
	end

end