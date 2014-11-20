#!/bin/env ruby
# encoding UTF-8

class Array
  def second
    self.each_with_index do |n, i|
      if i == 1
        return n
      end
    end
  end
end