# encoding UTF-8

require 'watir-webdriver'
require 'selenium-webdriver'
require 'syntax'
require 'slowhandcuke'
require 'htmlcuke'
require 'page-object'

Before do |scenario|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120 # seconds
  profile = Selenium::WebDriver::Firefox::Profile.new

  @browser = Watir::Browser.new(:firefox, :profile => profile, :http_client => client)
  @browser.driver.manage.timeouts.page_load = 120
end

After do |scenario|
  Dir::mkdir('reports') unless File.directory?('reports')
  Dir::mkdir('reports/screens') unless File.directory?('reports/screens')

  if scenario.failed?
    time = Time.now.strftime('%m-%d-%Y_%H.%M.%S')

    screenshot_format = "./reports/screens/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{time}.png"
    screenshot_embed = "./screens/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{time}.png"

    unless @compare.nil?
      @compare.driver.save_screenshot(screenshot_format)
      embed(screenshot_embed, 'image/png', 'Failed Screenshot')
      @compare.close
    end
  end
end