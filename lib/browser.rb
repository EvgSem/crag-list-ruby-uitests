class Browser
  @@driver = nil

	def initialize (driver)
		@@driver = driver
	end

  def generate_abstract_page
    return AbstractPage.new(@@driver)
  end
  	
	def delete_cookies
    @@driver.manage.delete_all_cookies
  end

  def quit
    @@driver.quit
  end
end