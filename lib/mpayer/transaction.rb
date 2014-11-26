module Mpayer

	class Transaction < Connect

		def initialize(*args)
		  super
		end

		def all
		  @all_url ="#{base_uri}/transactions/all"
		  HTTParty.get(
		  		@all_url.to_str, headers: @header)
		end

		def deposit(json_msg)
			@deposit_url = "#{base_uri}/transactions/deposit"
			HTTParty.put(
					@deposit_url.to_str, body: json_msg.to_json, headers: @header)
		end

		def withdraw(json_msg)
			@withdraw_url = "#{base_uri}/transactions/withdraw"
		  HTTParty.post(
		  		@withdraw_url.to_str, body: json_msg.to_json, headers: @header)
		end

		def transfer(json_msg)
			@transfer_url = "#{base_uri}/transactions/transfer"
		  HTTParty.post(
		  		@transfer_url.to_str, body: json_msg.to_json, headers: @header)
		end

	end
end