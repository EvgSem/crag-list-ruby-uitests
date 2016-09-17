class Browser
  	attr_reader :driver

  	def initialize(browser_name)
  		@driver = Selenium::WebDriver.for :chrome
    	delete_cookies
  	end
  	
	def delete_cookies
    	@driver.manage.delete_all_cookies
  	end

	def open_page(url)
    	@driver.navigate.to(url)
	    CraglistHomePage.new(@driver)
  	end
end