require 'spec_helper'

describe TsuruBlueGreen do
  let :app do
    "app"
  end

  let :token do
    "token"
  end

  let :target do
    "tsuru.example.com"
  end

  let :cname do
    "host.globoi.com"
  end

  let :json do
    '{"cname" : "host.globoi.com"}'
  end

  let :json_empty do
    '{"cname" : ""}'
  end

  it "should initialize" do
    TsuruBlueGreen.new
  end

  subject do
    TsuruBlueGreen.new :target => target, :token => token
  end

  describe "#cname" do
    it "should get the application when cname value is present" do
      stub_request(:get, "#{target}/apps/#{app}").with(:headers => {"Authorization" => "bearer #{token}"}).to_return(:body => json)
      expect(subject.cname).to eql cname
    end

    it "should retrun nil when cname value is not present" do
      stub_request(:get, "#{target}/apps/#{app}").with(:headers => {"Authorization" => "bearer #{token}"}).to_return(:body => json_empty)
      expect(subject.cname).to be_nil
    end
  end
end
