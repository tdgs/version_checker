require 'spec_helper'
require 'tempfile'
require 'open-uri'

describe "https_request" do


  it "should download a file" do
		sha1 = 'bd86661160326f5589f711a92cb4a7fe71741558'
    uri = URI("https://github.com/tdgs/test-repo/zipball/v0.2.0")
    filename = '/tmp/version_checker_tmp'
		VersionChecker.download(filename, uri)
		Digest::SHA1.new.file(filename).to_s.should eq(sha1)

  end
end

