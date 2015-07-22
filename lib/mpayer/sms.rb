class Mpayer::Sms < Mpayer::Base

	#POST
	#/messages
	#
	def send_message(json_msg)
    HTTParty.post('/messages', body: json_msg)
  end

end
