require 'spec_helper'

describe VersionChecker::GithubEngine do

  describe "initializer" do 
    it "should accept hash arguments" do
      g = VersionChecker::GithubEngine.new(:user => 'tdgs', :repo => 'version_checker')
      g.user.should eq('tdgs')
      g.repo.should eq('version_checker')
    end

    it "should accept string arguments" do
      g = VersionChecker::GithubEngine.new("tdgs/version_checker")
      g.user.should eq('tdgs')
      g.repo.should eq('version_checker')
    end

    it "should accept simple arguments" do
      g = VersionChecker::GithubEngine.new('tdgs', 'version_checker')
      g.user.should eq('tdgs')
      g.repo.should eq('version_checker')
    end
  end

  describe "functionality" do
    subject {VersionChecker::GithubEngine.new("tdgs/test-repo")}

    it "should fetch the tags hash" do
      h = subject.tags
      h.should be_a(Hash)
      h.keys.should eq(['v0.1.0', 'v0.2.0'])
    end

    describe "downloads url" do
      it "should return the latest version" do
        subject.latest_version.should eq("v0.2.0")
      end

      it "should get the zip url" do
        subject.version_url("v0.1.0", :zip).should eq("https://github.com/tdgs/test-repo/zipball/v0.1.0")
      end

      it "should get the tar url" do
        subject.version_url("v0.1.0", :tar).should eq("https://github.com/tdgs/test-repo/tarball/v0.1.0")
      end 

      it "should get the latest zip url" do
        subject.latest_url(:zip).should eq("https://github.com/tdgs/test-repo/zipball/v0.2.0")
      end

      it "should get the latest tar url" do
        subject.latest_url(:tar).should eq("https://github.com/tdgs/test-repo/tarball/v0.2.0")
      end

      it "should get the latest zip url by default" do
        subject.latest_url.should  eq("https://github.com/tdgs/test-repo/zipball/v0.2.0")
      end

      it "should return nil with invalid type" do
        subject.latest_url(:invalid).should_not be
      end
    end

    it "should cache the tags" do
      subject.should_receive(:fetch_tags).once.and_return({})
      subject.tags
      subject.tags
    end
  end
end

