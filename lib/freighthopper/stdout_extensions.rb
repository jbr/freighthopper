require 'pp'
require 'freighthopper/define_and_alias'
module Kernel
  def self.trace_output() @@trace_output ||= false end
  def self.trace_output=(t) @@trace_output = t end
  %w(print pp p puts).each do |method|
    define_and_alias method, :source_and_passthrough do |*args|
      puts_without_source_and_passthrough caller.first if Kernel.trace_output
      send :"#{method}_without_source_and_passthrough", *args
      puts_without_source_and_passthrough if Kernel.trace_output
      return *args
    end
  end
end
