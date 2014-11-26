class Client < Connect

	def initialize(*args)
	  super
	end
	
	def all_clients
	  @all_url ="#{base_uri}/clients/all_clients.json"
	  HTTParty.get(@all_url.to_str, headers: @header)
	end

	def new_client(json_msg)
	  @new_client_url = "#{base_uri}/clients.json"
	  HTTParty.post(
	  		@new_client_url.to_str, body: json_msg.to_json, headers: @header)
	end

	def client_accounts(client_id)
	  @client_accounts_url = "#{base_uri}/clients/#{client_id}/accounts.json"
	  HTTParty.get(@client_accounts_url.to_str, headers: @header)
	end

	def find_account(client_id, account_id)
	  @find_account_url ="#{base_uri}/clients/#{client_id}/accounts/#{account_id}"
	  HTTParty.get(@find_account_url.to_str, headers: @header)
	end

	def client_transactions(ac_id, client_id)
	  @transactions_url ="/clients/#{client_id}/accounts/#{ac_id}/transactions"
	  HTTParty.get(@transactions_url.to_str, headers: @header)
	end

	def client_payables(client_id)
	  @client_payables_url ="/clients/#{client_id}/payables"
	  HTTParty.get(@client_payables_url.to_str, headers: @header)
	end

	def new_account(json_msg, client_id)
	  @new_account_url ="/clients/#{client_id}/accounts/new.json" 
	  HTTParty.post(
	  		@new_account_url.to_str, body: json_msg.to_json, headers: @header)
	end

end