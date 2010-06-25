if defined?(ActiveRecord)
  class ActiveRecord::Base
    def element_id
      "#{self.class.to_s.underscore}_#{self.to_param}"
    end
  end
end
