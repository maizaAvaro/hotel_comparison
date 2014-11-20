def take_screenshot(link_text)
  time = Time.now.strftime('%m-%d-%Y_%H.%M.%S')
  in_step_screenshot_format = "./reports/screens/SHOT_#{$outline.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{time}.png"
  in_step_screenshot_embed = "./screens/SHOT_#{$outline.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{time}.png"

  @browser.driver.save_screenshot(in_step_screenshot_format)
  embed(in_step_screenshot_embed, 'image/png', "#{link_text}")
end

Given(/^I am on the Booking main page$/) do
  visit(BookingComMainPage)
  take_screenshot('Booking.com Main Page')
end

When(/^I enter "([^"]*)" in the Destination field$/) do |name|
  on(BookingComMainPage).search_destination_name(name)
end

Then(/^The text "([^"]*)" should appear in the Destination field$/) do |name|
  on(BookingComMainPage).destination_text.should eql?(name)
end

And(/^I enter the Check\-In Date of "([^"]*)" in the check\-in field$/) do |date_string|
  date_array = date_string.split(', ')
  month = date_array.first
  month_number = month.month_number_conversion
  day = date_array.second
  year = date_array.last
  on(BookingComMainPage).select_check_in_date(day,month_number, year)
end

And(/^I enter the Check\-Out Date of "([^"]*)" in the check\-out field$/) do |date_string|
  date_array = date_string.split(', ')
  month = date_array.first
  month_number = month.month_number_conversion
  day = date_array.second
  year = date_array.last
  on(BookingComMainPage).select_check_out_date(day, month_number, year)
end

When(/^I search the booking$/) do
  on(BookingComMainPage).submit_search
end

Then(/^I see the number of properties available$/) do
  on(BookingComSearchResultsPage).get_properties_info
  take_screenshot('Booking.com Search Results Page')
end

And(/^I make a sample room check for "([^"]*)" on the search page$/) do |hotel_name|
  on(BookingComSearchResultsPage).select_specific_hotel(hotel_name)
end

And(/^I view the details of the hotel I selected$/) do
  on(BookingComHotelDetailsPage).switch_to_window
  on(BookingComHotelDetailsPage).desired_element?
  take_screenshot('Booking.com Hotel Details Page')
end