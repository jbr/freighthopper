class Hash
  def map_keys(key_hash)
    inject({}) do |h, (k, v)|
      h.merge((key_hash[k] || k) => v)
    end
  end
end
