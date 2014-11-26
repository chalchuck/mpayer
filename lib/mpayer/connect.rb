require 'httparty'
require "wsse"
require "pry"

class Connect
	include HTTParty
	base_uri "https://app.mpayer.co.ke/api"

	def initialize(teller, token)
	  @teller = teller
	  @token  = token
	  @auth   = WSSE::header(@teller, @token)
    @header = { 
    						'Content-Type'=> 'application/json', 'Accept' => 'application/json', 'X-WSSE' => "#{@auth}"
    					}
	end

end