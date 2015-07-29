#!/bin/env ruby
# encoding UTF-8

class Array
  def position(index)
    self.each_with_index do |n, i|
      if i == index.to_i
        return n
      end
    end
    nil
  end
end