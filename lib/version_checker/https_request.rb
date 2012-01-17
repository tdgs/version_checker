require 'net/http'

module VersionChecker
  def self.https_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(req)

    response.body if response.is_a? Net::HTTPSuccess
  end
end
