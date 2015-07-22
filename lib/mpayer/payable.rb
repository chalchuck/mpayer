class Mpayer::Payable < Mpayer::Base

	#GET
	#/payables/all.json
	def all
		get('/payables/all.json')
	end

	#POST
	#/payables
	def create_payable(json_body)
		post('/payables', json_body)
	end

	#DELETE
	#/payables/id
	def delete(id)
		delete("/payables/#{id}")
	end

	#GET
	#/payables/all.json?payable_ids=#{ids.join(',')}
	def get_by_ids(ids)
		get("/payables/all.json?payable_ids=#{ids.join(',')}")
	end

	#GET
	#/accounts/:account_id/payable_items.json?per_page=100
	def payable_items(account_id)
		get("/accounts/#{account_id}/payable_items.json?", 100)
	end
	
end