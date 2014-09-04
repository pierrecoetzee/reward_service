# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/poltergeist'

# require Rails.root.join('db', 'seeds.rb')

Capybara.default_driver = (ENV['WEB_DRIVER'] || :poltergeist).to_sym

Capybara.default_wait_time = 10

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { debug: false, window_size: [800, 600] 
})

end

RSpec.configure do |config|

  config.color = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  
  config.infer_spec_type_from_file_location!

  config.fixture_path = Rails.root.join('spec', 'fixtures').to_s

  puts config.fixture_path

end