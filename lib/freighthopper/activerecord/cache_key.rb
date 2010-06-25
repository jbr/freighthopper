if defined?(ActiveRecord)
  class ActiveRecord::Base
    def cache_key
      [ self.class.to_s.underscore, to_param,
        ( soft_send(:cached_at).try(:to_i) ||
          soft_send(:updated_at).try(:to_i) )
      ].compact.join "/"
    end
  end
end
