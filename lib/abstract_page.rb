class AbstractPage < Browser
	def initialise (driver)
		super(driver)
	end

	def navigateToAppRoot
		@@driver.navigate.to ('https://sfbay.craigslist.org/')
		return HomePage.new (@@driver)
	end

	def getPageTitle
		return @@driver.title
	end
end