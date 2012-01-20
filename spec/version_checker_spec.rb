require 'spec_helper'
require 'tempfile'


describe VersionChecker::Checker do
	describe "class methods" do
		subject {VersionChecker::Checker}

		it "should return the github engine" do
			subject.engine(:github).should eq(VersionChecker::GithubEngine)
		end

		it "should return nil if engine unkown" do
			subject.engine(:unknown).should_not be
		end

		describe "instance methods" do
			let(:test_engine_klass) {double('engine_klass')}
			let(:test_engine) {double('engine')}
			before {
				test_engine.stub(:latest_version) {"v0.5.0"}
				test_engine.stub(:latest_url) {"www.google.com"}
				test_engine_klass.stub(:new).with(any_args) {test_engine}
				VersionChecker::Checker.stub(:engine).with(:test) {test_engine_klass}
			}


			subject {VersionChecker::Checker.new(:test, "v0.1.0", "tdgs/test-repo")}

			its(:current_version) {should eq("v0.1.0")}
			its(:latest_version) {should eq("v0.5.0")}
			its(:latest_url) {should eq('www.google.com')}

			it "should download the file" do
				filename = 'lala'
				VersionChecker.should_receive(:download).with(filename, subject.latest_url)
				subject.download_zip(filename)
			end
		end
	end
end
