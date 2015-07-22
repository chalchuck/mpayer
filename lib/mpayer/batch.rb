class Mpayer::Batch < Mpayer::Base

	#POST
	#/batch
	def fetch(args)
		batch_post("#{base_url}/batch", body: "requests=#{args[0].to_json}", batch=true)
	end

end