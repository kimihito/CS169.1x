#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
class Numeric
  @@currencies = {'yen' =>  0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

  def method_missing(method_id)
    singlar_currency = method_id.to_s.gsub(/s$/,'')
    @src_currency = singlar_currency
    if @@currencies.has_key?(singlar_currency)
      self * @@currencies[singlar_currency]
    else
      super
    end
  end

  def in(dst_currency)
    (1/@@currencies[dst_currency.to_s.gsub(/s$/, '')]) * self
  end
end


puts 5.dollars.in(:yens)


class String
  def palindrome?
    self.downcase == self.downcase.reverse
  end
end

module  Enumerable
  def palindrome?
    self == self.reverse
  end
end

puts "foo".palindrome?

puts [1,2].palindrome?
