#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
class CartesianProduct
  include Enumerable

  def initialize(collection1, collection2)
    @collection1 = collection1
    @collection2 = collection2
  end

  def each
    @collection1.each do |val1|
      @collection2.each do |val2|
        yield([val1, val2])
      end
    end
  end
end


c = CartesianProduct.new([:a,:b,:c], [4,5])
c.each { |elt| puts elt.inspect }
