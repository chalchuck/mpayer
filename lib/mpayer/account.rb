class Mpayer::Account < Mpayer::Base

	#GET
	#/accounts/all_accounts.json
	def all
		get('/accounts/all_accounts.json')
	end

	#GET
	#/accounts/all_accounts?accounts_array=#{ids.join(',')}
	def fetch_by_ids(*ids)
	  get("/accounts/all_accounts?accounts_array=#{ids.join(',')}")
	end

	#GET
	#/accounts/:id
	def fetch_account(id)
		get("/accounts/#{id}.json")
	end

	#GET
	#/accounts/:id
	def balance(id)
		fetch_account(id)['balance'].to_f
	end

	#GET
	#/accounts/:account_id/members?per_page=100
	def subscribers(account_id)
		get("/accounts/#{account_id}/members?")
	end

	#POST
	#/accounts/:account_id/enroll
	def enroll(account_id, json_body)
		post("/accounts/#{account_id}/enroll", json_body)
	end

end