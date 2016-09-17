class CraglistSearchPage
	def initialize(driver)
    @driver = driver
	end
  	
	def show_result 
    fileName = generateResultFileName();
    resultList = "===================== Results for " + fileName +" ==================== \n"

    begin
      verify_page()

      resultElements = @driver.find_element(:id, "sortable-results")
                              .find_elements(:css, ".row a.hdrlnk")

      resultElements.each { |item| resultList = resultList + mapRowToString(item)}
    end while tryNavigateNext()

    outputResult(fileName, resultList)
	end

  def tryNavigateNext
    nextButton = @driver.find_element(:css, "a.next")
    isNextButtonDisplayed = nextButton.displayed? == true

    if isNextButtonDisplayed
      nextButton.click();
    end 

    isNextButtonDisplayed
  end

  def outputResult(fileName, resultString)
    File.open('./features/results/'+ fileName, 'w') {|f| f.write(resultString) }
    print resultString
  end

  def mapRowToString(htmlRow) 
    title = "\n" + htmlRow.text()
    url = "\n" + htmlRow.attribute('href') + "\n"
    title + url
  end

  def generateResultFileName 
    url = @driver.current_url
    url.slice! "https://"
    fileName = url.gsub("/", '-')
  end 

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 100)
    wait.until { @driver.find_elements(:id => 'sortable-results') }
  end
end