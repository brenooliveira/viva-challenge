ENV['RACK_ENV'] ||= 'test'

require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
  add_filter "boot.rb"
  add_filter 'presenters'

  add_group "Api", "../app/api"
  add_group "Domain", "../app/domain"
end

require "rack/test"
require 'helper'

Bundler.require
Bundler.setup(:default, :test)

require File.expand_path('../../boot', __FILE__)
require 'rack/test'
require 'vcr'
require 'webmock'
require 'factory_girl'

def app
  API::VivaChallenge
end

RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation
  config.include Helper
  config.include Rack::Test::Methods
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.before :each do
    Mongoid.purge!
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
