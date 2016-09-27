require 'selenium-webdriver'
require 'cucumber'
require 'require_all'

require_all 'lib'

Before do |scenario|
    @browser = Browser.new(Selenium::WebDriver.for :chrome)
    @abstract_page = @browser.generate_abstract_page
    @abstract_page.delete_cookies
end

After do |scenario|
	@browser.quit
end
