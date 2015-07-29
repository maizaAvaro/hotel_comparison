class BookingComHotelDetailsPage < NathanPageObject

  def desired_element?
    Watir::Wait.until{@browser.span(:id => 'hp_hotel_name').exists?}
  end

  def switch_to_window
    sleep 0.5
    @browser.windows.last.use
  end

end