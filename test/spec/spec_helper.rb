# This is a file that contains all the commonly used test methods
require 'capybara/rspec' # specifically rspec within capybara
require 'selenium-webdriver' # for browser integration
require 'dotenv/load' # to load native .env file
require 'holdon'
#Dotenv.load(env location)

# setting default testing browser to chrome
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
