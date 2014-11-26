require "mpayer/version"
require 'httparty'
require "wsse"

module Mpayer
	include HTTParty 
  base_uri "https://app.mpayer.co.ke/api"

  def initialize(user_no, token)
    @user_no = user_no
    @token   = token
    @auth    = WSSE::header(@user_no, @token)
    @header  = {'Content-Type'=> 'application/json', 'Accept' => 'application/json', 'X-WSSE' => "#{@auth}" }
  end

  def login(username, password)
    login_url = "#{base_uri}/login"
    json_msg  = { user: username, password: password }
    HTTParty.post(
        login_url.to_str, body: json_msg.to_json, headers: @header)
  end

  def transaction
    Transaction.new(@user_no, @token)
  end

  def payable
    Payable.new(@user_no, @token)
  end

  def client
    Client.new(@user_no, @token)
  end

  def sms
    MpayerSms.new(@user_no, @token)
  end  

  def mpayer_account
    MpayerAccount.new(@user_no, @token )
  end

end