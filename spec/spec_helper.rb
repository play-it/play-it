require 'simplecov'
SimpleCov.start

require 'rspec'
require 'rspec/its'
require 'fakefs/spec_helpers'
require './lib/play_it.rb'

Dir['./spec/support/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = 'doc'

  config.include JsonHelper
  config.include HashHelper
end
