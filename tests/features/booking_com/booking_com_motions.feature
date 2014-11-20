Feature:
  As a user I want to book a hotel on the Booking.com website
  and check this data against TST hotel bookings

  Scenario: Navigate to Booking.com website
    Given I am on the Booking main page
    And I take a screenshot of the "Booking.com Main Page"
    And I enter "Beijing, China" in the Destination field
    And I enter the Check-In Date of "February, 8, 2015" in the check-in field
    And I enter the Check-Out Date of "February, 9, 2015" in the check-out field
    And I search the booking
    And I see the number of properties available
    And I take a screenshot of the "Booking.com Search Results Page"
    And I make a sample room check for "Legendale" on the search page
    And I view the details of the hotel I selected
    And I take a screenshot of the "Booking.com Hotel Details Page"