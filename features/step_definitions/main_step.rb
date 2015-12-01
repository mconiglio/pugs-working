require 'spec'
require "watir-webdriver"
browser = Watir::Browser.new

SITE = "www.pugs.com"
BROWSER = Watir::Browser.start(SITE, :firefox)
PAGES = {
  "PUGS Home" => "http://www.pugs.com/"
}

Given /^that I am on (.*)$/ do |page|
  BROWSER.goto(PAGES[page])
end

When /^I click on link (.*)$/ do  |link|
  BROWSER.link(:text, link).click
end

Then /^the page title should be "([^"]*)"$/ do |title|
  BROWSER.title.eql?(title).should == true
end