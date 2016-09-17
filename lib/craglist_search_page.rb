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
    consoleOutput = String::new(resultString)
    filePath = './features/results/'+ fileName

    if File.file?(filePath)
      prevResultsfile = File.open(filePath, "r")  

      while (line = prevResultsfile.gets)
        doesInclude = resultString.include? line
        if doesInclude && line.to_s != ''
          consoleOutput.slice! line
        end
      end
    end 

    File.open('./features/results/'+ fileName, 'w') {|f| f.write(resultString) }
    print consoleOutput
  end

  def mapRowToString(htmlRow) 
    "\n" + htmlRow.text() + ": " + htmlRow.attribute('href') + "\n"
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