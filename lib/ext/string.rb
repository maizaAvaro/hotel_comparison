#!/bin/env ruby
# encoding UTF-8

class String
  def month_number_conversion
    case self
      when 'January'
        number = 1
      when 'February'
        number = 2
      when 'March'
        number = 3
      when 'April'
        number = 4
      when 'May'
        number = 5
      when 'June'
        number = 6
      when 'July'
        number = 7
      when 'August'
        number = 8
      when 'September'
        number = 9
      when 'October'
        number = 10
      when 'November'
        number = 11
      when 'December'
        number = 12
      else
        raise Exception, 'Please enter a valid month string.'
    end
    number
  end
end