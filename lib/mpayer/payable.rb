class Payable

	def all
	  @payables_url = "#{base_uri}/payables/all.json"
	  HTTParty.get(@payables_url.to_str, headers: @header)
	end

	def new(json_msg)
	  @new_payable_url = "#{base_uri}/payables"
	  HTTParty.post(
    		@new_payable_url.to_str, body: json_msg.to_json, headers: @header)
	end

	def delete(payable_id)
	  @delete_payable_url = "#{base_uri}/payables/#{payable_id}"
	  HTTParty.delete(
    		@delete_payable_url.to_str, body: json_msg.to_json, headers: @header)
	end

	def fetch_batch_records(*args)
		@headers = { 'Content-Type' => 'application/x-www-form-urlencoded', 'X-WSSE' => WSSE::header(@user_no, @token) }
	  @batch_records_url = "#{base_uri}/batch"
	  json_msg = "requests=#{args[0].to_json}"
	  HTTParty.post(
    		@batch_records_url.to_str, body: json_msg, headers: @headers)
	end

	def get_payable_by_ids(*args)
	  @payables_url = "/payables/all.json?payable_ids=#{args.join(',')}"
	  HTTParty.get(@payables_url.to_str, headers: @header)
	end

	def payable_items(account_id)
	  @payable_items_url = "#{base_uri}/accounts/#{account_id}/payable_items.json?per_page=100"
	  HTTParty.get(@payable_items_url.to_str, headers: @header)
	end

	def group_payable_items(account_id)
	  @payable_items_url = "#{base_uri}/accounts/#{@account_id}/payable_items.json?ac_type=terminal_ac&per_page=100"
	  HTTParty.get(@payable_items_url.to_str, headers: @header)
	end

end