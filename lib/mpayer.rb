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

  def transaction(*opts)
    @opts = opts
    Transaction.new(@user_no, @token)
  end

  def payable(*opts)
    @opts = opts
    PayableTrans.new(@user_no, @token)
  end

  def client(*opts)
    Client.new(@user_no, @token)
  end

  def sms(*opts)
    SMS.new(@user_no, @token)
  end  

  def mpayer_account(*opts)
    MpayerAccount.new(@user_no, @token )
  end

  def login(username, password)
    login_url = "#{base_uri}/login"
    json_msg  = { user: username, password: password }
    HTTParty.post(
        login_url.to_str, body: json_msg.to_json, headers: @header)
  end


  # def initialize(user_no, token)
  #   @auth = WSSE::header("PZ0378", "j4jcrRM8zduoSd3U64Ye")
  #   @header = {'Content-Type'=>'application/json','Accept' => 'application/json','X-WSSE' => "#{WSSE::header("PZ0378", "j4jcrRM8zduoSd3U64Ye")}"}
  # end

  # def self.transactions
  # 	get('/transactions/all.json', @headers)
  # end

  # def self.find(tran_id)
	 #  @id = tran_id
	 #  @link ="/transactions/#{@id}"
	 #  get('/transactions/all.json', "#{options}")
	 #  @url = URI.parse("#{@@root_url}#{@link}")
	 #  send_get_request("#{@@root_url}#{@link}", @url.path, "", @headers)
  # end

  # def self.deposit(json_msg, auth)
  #   @deposit_url = "https://app.mpayer.co.ke/api/transactions/deposit"
  #   HTTParty.put(@deposit_url.to_str,
  #     body: json_msg.to_json,
  #     headers: {'Content-Type'=>'application/json','Accept' => 'application/json','X-WSSE' => "#{auth}"}
  #     )
  # end

end

# Mpayer.transactions(headers: {'Content-Type'=>'application/json','Accept' => 'application/json','X-WSSE' => "#{WSSE::header("PZ0378", "j4jcrRM8zduoSd3U64Ye")}"})