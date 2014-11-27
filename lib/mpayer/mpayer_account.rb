require 'httparty'
require "wsse"
require "pry"

module Mpayer
	class MpayerAccount
		include HTTParty	
		@@base_uri = "https://app.mpayer.co.ke/api"

	  def initialize(user_no, token)
	    @user_no = user_no
	    @token   = token
	    @auth    = WSSE::header(@user_no, @token)
	    @header  = {'Content-Type'=> 'application/json', 'Accept' => 'application/json', 'X-WSSE' => "#{@auth}" }
	  end

		def all
		  @accounts_url = "#{@@base_uri}/accounts/all_accounts.json"
		  HTTParty.get(@accounts_url.to_str, headers: @header)
		end

		def find(id)
		  @account_url ="#{@@base_uri}/accounts/#{id}"
		  HTTParty.get(@account_url.to_str, headers: @header)
		end

		def batch_accounts(*args)
		  @batch_accounts_url = "#{@@base_uri}/accounts/all_accounts?accounts_array=#{args.join(',')}"
		  HTTParty.get(@batch_accounts_url.to_str, headers: @header)
		end
		
		def members(id)
		  @members_of_account_url = "#{@@base_uri}/accounts/#{id}/members?per_page=100"
		  HTTParty.get(@members_of_account_url.to_str, headers: @header)
		end

		def enroll(json_msg, id)
		  @enroll_member_url = "#{@@base_uri}/accounts/#{id}/enroll"
		  HTTParty.post(
		  		@enroll_member_url.to_str, body: json_msg.to_json, headers: @header)
		end

	end
end