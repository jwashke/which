# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require "simplecov"
SimpleCov.start("rails")
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitch] = OmniAuth::AuthHash.new({
  provider:     'twitch',
  uid:          '12345',
  extra: {
    raw_info: {
      display_name: 'mrjoshuagiraffe',
      email:        'mrjoshuagiraffe@gmail.com'
    }
  },
  credentials: {
    token: ENV["USER_TOKEN"]
  }
})

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.mock_with :mocha
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
