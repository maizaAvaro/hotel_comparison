$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib') )

require 'require_all'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'page-object'
require 'watir-webdriver-performance'
require 'colorize'
require 'pry'
require 'pry-byebug'
require 'pry-editline'
require 'syntax'
require 'slowhandcuke'
require 'htmlcuke'

require_all 'lib'

Before do
  $html_report = self
end

World(PageObject::PageFactory)

