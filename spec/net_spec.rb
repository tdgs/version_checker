require 'spec_helper'
require 'tempfile'
require 'uri'

describe "https_request" do

  it "should be a success when given valid url" do
    r = VersionChecker::https_request(URI('https://www.google.com'))
    r.should be
    r.should_not be_empty
  end

  it "should return nil when error" do
    r = VersionChecker::https_request(URI('https://www.google.com/errrorr'))
    r.should_not be
  end

  it "should download a file" do
    uri = URI("https://github.com/tdgs/test-repo/zipball/v0.2.0")
    filename = '/tmp/version_checker_tmp'

    File.open(filename) { |file| VersionChecker::download(file, uri)}



  end
end

