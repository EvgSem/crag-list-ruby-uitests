class CraglistHomePage
  def initialize(driver)
    @driver = driver
  end

  def select_area(area)
  	link  = @driver.find_element(:link_text, area);
  	link.click();
  end

  def select_subarea(subarea)
    if subarea != ""
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until { @driver.find_element(:link_text, subarea) }

      link = @driver.find_element(:link_text, subarea)
      link.click();
    end
  end

  def select_category_in_section(category, section)
    xpath = "//a[descendant::*[contains(., '" + category + "')]][ancestor::*[descendant::*[contains(., '" + section + "')]]]"
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    
    wait.until { @driver.find_element(:xpath => xpath) }
    link  = @driver.find_element(:xpath => xpath);
    
    link.click();
    CraglistSearchPage.new(@driver);
  end

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id => 'rightbar') }
  end
end