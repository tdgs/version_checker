require 'open-uri'

module VersionChecker
	extend self

	LIMIT = 10

	def download(filename, uri)
		open(filename, "w") do |file|
			file.write open(uri).read
		end
	end
end
