require 'page-object'

class HomePage < AbstractPage
  # attr_accessor :area_param, :subarea_param, :section_param, :category_param

  def initialize(driver)
    super(driver)
  end

  def select_area(areaParam)
    pageObj = HomePageObj.new(@@driver)
    pageObj.area()
    return HomePage.new(@@driver)
  end

  def select_subarea(subarea)
    if subarea != ""
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until { @@driver.find_element(:link_text, subarea) }

      link = @@driver.find_element(:link_text, subarea)
      link.click()
      return HomePage.new(@@driver)
    end
  end

  def select_category_in_section(category, section)
    xpath = "//a[descendant::*[contains(., '" + category + "')]][ancestor::*[descendant::*[contains(., '" + section + "')]]]"
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    
    wait.until { @@driver.find_element(:xpath => xpath) }
    link  = @@driver.find_element(:xpath => xpath);
    
    link.click();
    return SearchPage.new(@@driver);
  end

  def verify_page
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @@driver.find_element(:id => 'rightbar') }
  end
end