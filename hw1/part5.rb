#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
class Class
  def attr_accessor_with_history(attr_name)
    @attr_name = attr_name.to_s       # make sure it's a string
    attr_reader @attr_name            # create the attribute's getter
    attr_reader @attr_name+"_history" # create bar_history getter
    @definition = %Q{
      def initialize
        @history_hash = Hash.new [nil]
        @history_hash[#{@attr_name}] = Array.new << nil
      end

      def #{@attr_name}= arg1
        @history_hash[#{@attr_name}] << arg1
      end

      def #{@attr_name}_history
        @history_hash[#{@attr_name}]
      end
    }
    class_eval @definition
  end
end

