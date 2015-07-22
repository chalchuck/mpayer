class Mpayer::Base

  attr_accessor :user_no, :mpayer_token, :base_url

  def initialize(user_no: nil, mpayer_token: nil, base_url: 'https://app.mpayer.co.ke/api')
    @base_url ||= base_url 
    @user_no ||= user_no
    @mpayer_token ||= mpayer_token
  end

  def parse_api_response(response)
    JSON.parse(response.body)
  end

  def auth
    WSSE.header(user_no, mpayer_token).to_s
  end

  def get(url, per_page=10)
    response = Typhoeus.get("#{base_url}#{url}?per_page=#{per_page}", headers: headers)
    parse_api_response(response)
  end

  def delete(url)
    response = Typhoeus.delete("#{base_url}#{url}", headers: headers)
    parse_api_response(response)
  end

  def post(url, body, batch=false)
    headers = batch_headers if batch == true
    response = Typhoeus.post("#{base_url}#{url}", body: body.to_json, headers: headers)
    parse_api_response(response)
  end

  def put(url, body)
    response = Typhoeus.put("#{base_url}#{url}", body: body.to_json, headers: headers)
    parse_api_response(response)
  end

private
  
  def headers
    { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'X-WSSE' => auth }
  end

  def batch_headers
    { 'Content-Type' => 'application/x-www-form-urlencoded', 'X-WSSE' => auth }
  end

end