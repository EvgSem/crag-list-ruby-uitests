require 'page-object'

class HomePageObj < AbstractPage
  include PageObject

  link(:area, :link_text => "los angeles")
  link(:subarea, :link_text => "xxx")
  link(:category_in_section, :xpath => "//a[descendant::*[contains(., '" + "sdf" + "')]][ancestor::*[descendant::*[contains(., '" + "sdf" + "')]]]")
  div(:rightbar, :id => 'rightbar')
end