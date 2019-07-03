require 'rails_helper'
require 'launchy'
require "rspec"
require "capybara"
require "capybara/rspec"
require "selenium/webdriver"

Capybara.configure do |config|
  config.run_server = false
  config.app_host = "http://localhost:3000"
  config.default_driver = :selenium_chrome_headless
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.describe "Responses", type: :system  do
  describe "GET /responses", :js  do
    it "works! (now write some real specs)" do
      username = "ezekiel"
      password = "qwerty"
      visit responses_path
      save_and_open_page
      # expect(response).to have_http_status(2001)
    end
  end
end
