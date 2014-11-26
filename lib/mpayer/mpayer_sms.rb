module Mpayer
	class MpayerSms < Connect

		def send_message(json_msg)
	    @send_message_link = "#{base_uri}/messages"
	    HTTParty.post(
	    		@send_message_link.to_str, body: json_msg.to_json, headers: @header)
	  end
	end

end