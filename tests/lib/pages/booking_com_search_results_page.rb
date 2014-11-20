class BookingComSearchResultsPage < NathanPageObject

  def properties_header
    Watir::Wait.until{@browser.div(:class => 'sr_header').present?}
    @browser.div(:class => 'sr_header')
  end

  def total_properties_details
    properties_header.h1.text
  end

  def properties_breakdown
    types = properties_header.p(:class => 'property_types_filters_links').links.to_a
    array = []
    types.each do |n|
      array << n.text
    end
    array
  end

  def get_properties_info
    info = total_properties_details
    $html_report.puts "#{info}"
    detail_info = properties_breakdown
    detail_info.each do |n|
      $html_report.puts "#{n}"
    end
  end

  def select_specific_hotel(hotel_name)
    hotel_array = @browser.links(:class => 'hotel_name_link').to_a
    desired_hotel = nil
    hotel_array.each do |n|
      test_array = n.title.split(' ')
      if test_array.include?(hotel_name)
        desired_hotel = n
      end
    end
    if desired_hotel.nil?
      raise Exception, 'Could not find specified hotel.'
    else
      desired_hotel.click
    end
  end

end