Given(/^I am on the Booking main page$/) do
  visit(BookingComMainPage)
end

When(/^I enter "([^"]*)" in the Destination field$/) do |name|
  on(BookingComMainPage).search_destination_name(name)
end

Then(/^The text "([^"]*)" should appear in the Destination field$/) do |name|
  on(BookingComMainPage).destination_text.should eql?(name)
end