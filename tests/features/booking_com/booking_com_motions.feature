Feature:
  As a user I want to book a hotel on the Booking.com website
  and check this data against TST hotel bookings

  Scenario: Navigate to Booking.com website
    Given I am on the Booking main page
    When I enter "Beijing, China" in the Destination field
    Then The text "Beijing, China" should appear in the Destination field