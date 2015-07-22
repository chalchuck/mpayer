class Mpayer::Client < Mpayer::Base

	#GET
	#/clients/all_clients.json
	def all
		get('/clients/all_clients.json')
	end

	#POST
	#/clients.json
	def create_on_mpayer(json_body)
		post(%{/clients}, body: json_body)
	end

	#GET
	#/clients/:id #id: 21556
	def fetch_client(id)
		get(%{/clients/#{id}.json})
	end

	# /clients/:id/accounts.json"
	# GET
	def fetch_accounts(id)
		get(%{/clients/#{id}/accounts.json})
	end

	# /clients/:client_id/accounts.json"
	# GET
	def fetch_account(id)
		get(%{/clients/#{id}/accounts.json})
	end

	#GET
	#/clients/:client_id/accounts/:ac_id/transactions"
	def fetch_transactions(client_id, ac_id)
		get(%{/clients/#{client_id}/accounts/#{ac_id}/transactions.json})
	end

	#POST
	#/clients/:client_id/accounts/new.json
	def create_client_account(id, json_body)
		post(%{/clients/#{id}/accounts/new.json}, body: json_body)
	end

end