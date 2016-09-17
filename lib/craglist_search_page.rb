class CraglistSearchPage
	def initialize(driver)
    @driver = driver
	end
  	
	def show_result 
    url = @driver.current_url
    url.slice! "https://"
    fileName = url.gsub("/", '-')

    isNextDisplayed = true;
    resultList = "===================== Results for " + fileName +" ==================== \n"
    begin
      wait = Selenium::WebDriver::Wait.new(:timeout => 100)
      wait.until { @driver.find_elements(:id => 'sortable-results') }

      resultElements = @driver.find_element(:id, "sortable-results")
                            .find_elements(:css, ".row a.hdrlnk")
      resultElements.each { |item| resultList = resultList + mapRowToString(item)}
      if @driver.find_element(:css, "a.next").displayed? == true
        @driver.find_element(:css, "a.next").click();
      else
        isNextDisplayed = false;
      end
    end while isNextDisplayed

    File.open('./features/results/'+ fileName, 'w') {|f| f.write(resultList) }
    print resultList
	end

  def mapRowToString(htmlRow) 
    title = "\n" + htmlRow.text()
    url = "\n" + htmlRow.attribute('href') + "\n"
    title + url
  end

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 100)
    wait.until { @driver.find_elements(:id => 'sortable-results') }
  end
end