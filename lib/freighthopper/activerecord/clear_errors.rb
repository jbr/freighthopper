if defined?(ActiveRecord)
  class ActiveRecord::Errors
    def clear_on(attribute)
      @errors.delete attribute.to_s
    end
  end
end
