module Mpayer
	module API
		module Transactions
			

			## Returns up to 100 transactions of the connected user

			def all_transactions(headers={}, options={})
				get('/transactions/all.json', headers: {'Content-Type'=>'application/json','Accept' => 'application/json','X-WSSE' => "#{WSSE::header("PZ0378", "j4jcrRM8zduoSd3U64Ye")}" })
			end
		end
	end
end