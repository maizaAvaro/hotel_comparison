# encoding UTF-8

require 'watir-webdriver'
require 'selenium-webdriver'
require 'syntax'
require 'slowhandcuke'
require 'htmlcuke'

Before do |scenario|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120 # seconds
  profile = Selenium::WebDriver::Firefox::Profile.new

  @compare = Watir::Browser.new(:firefox, :profile => profile, :http_client => client)
  @compare.driver.manage.timeouts.page_load = 120
end

After do |scenario|
  Dir::mkdir('reports') unless File.directory?('reports')
  Dir::mkdir('reports/screens') unless File.directory?('reports/screens')

  if scenario.failed?
    
  end
end