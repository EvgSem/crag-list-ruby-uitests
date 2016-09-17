class CraglistSearchPage
	def initialize(driver)
    	@driver = driver
  	end
  	
  	def show_result
  		resultElements = @driver.find_element(:id, 'sortable-results').find_elements(:css, "p.row")
  # 		i=0;
  # 		resultElements.each do |item|
  # 			push i
  # 			i = i+1;
		# end
  	end
end