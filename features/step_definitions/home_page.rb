Given /^I open the Craigslist home page$/ do
  @home_page = @abstract_page.navigateToAppRoot
  @home_page.verify_page
end

When /^I select area "(.*?)"$/ do |area|
  @home_page.select_area(area)
end

When /^I select subarea "(.*?)"$/ do |subarea|
  @home_page.select_subarea(subarea)
end

When /^I select category "(.*?)" in section "(.*?)"$/ do |category, section|
  @search_page = @home_page.select_category_in_section(category, section)
end