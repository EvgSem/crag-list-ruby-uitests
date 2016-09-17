Given /^I open the Craigslist home page$/ do
    @craglist_home_page = @browser.open_page('https://sfbay.craigslist.org/')
    @craglist_home_page.verify_page
end

When /^I select area "(.*?)"$/ do |area|
  @craglist_home_page.select_area(area)
end

When /^I select subarea "(.*?)"$/ do |subarea|
  @craglist_home_page.select_subarea(subarea)
end

When /^I select category "(.*?)" in section "(.*?)"$/ do |category, section|
  @craglist_home_page.select_category_in_section(category, section)
end