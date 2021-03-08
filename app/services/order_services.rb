class OrderServices < ApplicationService
  require 'net/http'
  require 'uri'

  URL = URI(ENV['API_URL'])

  
  def call(data)
    response = connection.request(request(data.to_json))
    
    response.code == '200'
  end
  
  private
  
  def request(body)
    req = Net::HTTP::Post.new(URL)
    req['Content-Type'] = 'application/json'
    req['X-Sent'] = Time.zone.now.strftime('%Hh%M - %d/%m/%y')
    req.body = body
    req
  end
  
  def connection
    http = Net::HTTP.new(URL.host, URL.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end