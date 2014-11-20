class BookingComMainPage < NathanPageObject

  page_url('http://www.booking.com')

  text_field(:destination_name, :id => 'destination')
  button(:search_button, :class => 'b-button_primary', :type => 'submit')

  def submit_search
    search_button
  end

  def destination_list
    Watir::Wait.until{@browser.links(:class => 'ui-corner-all').first.present?}
    @browser.links(:class => 'ui-corner-all')
  end

  def destination_list_element(index)
    @browser.link(:class => 'ui-corner-all', :index => index)
  end

  def search_destination_name(name)
    Watir::Wait.until{ @browser.input(:id => 'destination').present? }
    self.destination_name = name
    auto_select(name)
  end

  def destination_text
    destination_name_element.when_present.text
  end

  def auto_select(input)
    count = destination_list.size - 1
    fmt_array = input.split(', ')
    (0..count).each do |n|
      boolean_count = 0
      list_array =  destination_list_element(n).text
      list_array = list_array.split(', ').collect(&:strip)
      fmt_array.each do |m|
        if list_array.include?(m)
          boolean_count += 1
        end
      end
      if boolean_count == fmt_array.size
        destination_list_element(n).click
      end
    end
  end

  def check_in_year_month_list
    @browser.select(:name => 'checkin_year_month')
  end

  def check_in_day_list
    @browser.select(:name => 'checkin_monthday')
  end

  def check_out_day_list
    @browser.select(:name => 'checkout_monthday')
  end

  def check_out_year_month_list
    @browser.select(:name => 'checkout_year_month')
  end

  def select_check_in_date(day, month, year)
    check_in_day_list.option(:value => "#{day.to_s}").click
    check_in_year_month_list.option(:value => "#{year.to_s}-#{month.to_s}").click
  end

  def select_check_out_date(day, month, year)
    check_out_day_list.option(:value => "#{day.to_s}").click
    check_out_year_month_list.option(:value => "#{year.to_s}-#{month.to_s}").click
  end

end