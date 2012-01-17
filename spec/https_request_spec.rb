require 'spec_helper'
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
end

