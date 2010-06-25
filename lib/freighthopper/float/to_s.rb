require 'freighthopper/define_and_alias'

class Float
  define_and_alias :to_s, :format do |*args|
    format = args.first
    return to_s_without_format if format.nil?
    format = "$%0.2f" if format == :usd
    (format.is_a?(Fixnum) ? "%0.#{format}f" : format) % self
  end
end
