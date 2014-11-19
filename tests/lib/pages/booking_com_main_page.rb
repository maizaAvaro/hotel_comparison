class BookingComMainPage < NathanPageObject

  page_url('http://www.booking.com')

  input(:destination_name, :id => 'destination')

  def search_destination_name(name)
    wait_for_ajax
    self.destination_name_element.when_present.set(name)
  end

  def destination_text
    destination_name_element.text
  end

end