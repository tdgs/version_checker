require 'net/http'

module VersionChecker
  def self.https_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.port == 443
    req = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(req)

    response.body if response.is_a? Net::HTTPSuccess
  end

  def download(filename, uri)
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri.request_uri

      http.request request do |response|
        open filename, 'w' do |io|
          response.read_body {|chunk| io.write chunk}
        end
      end
    end
  end
end

