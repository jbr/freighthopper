require 'freighthopper/array/singular'
require 'freighthopper/string/unindent'

class Module  
  def antonym_accessor(*args)
    if 2 == args.length
      from, to = args
      define_method("#{to}?") { not send "#{from}?" }
      define_method("#{to}=") {|val| send "#{from}=", ! val }
    elsif args.singular.is_a?(Hash)
      args.singular.each {|from, to| antonym_accessor from, to}
    else
      message = <<-EXCEPTION
        antonym_accessor expects either
          "antonym_accessor :from, :to"
        or "antonym_accessor :from => :to"
      EXCEPTION

      raise message.unindent
    end
  end
end
