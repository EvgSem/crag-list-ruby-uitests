Then /^I should see the result list$/ do
	@search_page.verify_page;
    @search_page.show_result;
end