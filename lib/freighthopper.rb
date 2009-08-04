class Module
  def define_and_alias(target, feature, &blk)
    aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
    define_method :"#{aliased_target}_with_#{feature}#{punctuation}", &blk
    alias_method_chain target, feature
  end
end

module Array
  def singular?() size == 1 end
  def singular() singular?? first : nil end
  def singular!() singular or raise "not singular" end
end

class Object
  def soft_send(method, *args)
    send method, *args if respond_to? method
  end
  
  def or_if_blank(val = nil)
    soft_send(:blank?) ? (val || yield) : self
  end
end

class ActiveSupport::Cache::FileStore
  define_and_alias :delete, :puts do |*args|
    puts "deleting "+real_file_path(args.first)
    delete_without_puts *args
  end
end


class Array
  def mean
    sum/size.to_f
  end
end

class Hash
  def map_keys(key_hash)
    inject({}) do |h, (k, v)|
      h.merge((key_hash[k] || k) => v)
    end
  end
end

class Float
  define_and_alias :to_s, :format do |*args|
    format = args.first
    return to_s_without_format if format.nil?
    format = "$%0.2f" if format == :usd
    (format.is_a?(Fixnum) ? "%0.#{format}f" : format) % self
  end
end

require 'pp'
module Kernel
  mattr_accessor :trace_output  
  %w(pp p puts).each do |method|
    define_and_alias method, :source_and_passthrough do |*args|
      puts_without_source_and_passthrough caller.first if Kernel.trace_output
      send :"#{method}_without_source_and_passthrough", *args
      puts_without_source_and_passthrough if Kernel.trace_output
      return *args
    end
  end
end

# Kernel.trace_output = true

class ActionMailer::Base
  class << self
    define_and_alias :method_missing, :delayed_deliver do |method_name, *args|
      if method_name.to_s =~ /^delayed_(deliver_[a-z_]+)$/
        self.send_later $1, *args
      else
        method_missing_without_delayed_deliver(method_name, *args)
      end
    end
  end
end

module ActiveRecord
  class Errors
    def clear_on(attribute)
      @errors.delete attribute.to_s
    end
  end
  
  class Base
    extend ActiveSupport::Memoizable
    
    def cache_key
      [self.class.to_s.underscore, to_param, soft_send(:cached_at).try(:to_i) || soft_send(:updated_at).try(:to_i)].compact.join("/")
    end

    def element_id
      "#{self.class.to_s.underscore}_#{self.to_param}"
    end
  end
end