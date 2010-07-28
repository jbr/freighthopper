class Object
  def eigenclass
    class << self
      self
    end
  end

  def define_eigenmethod(method_name, &blk)
    eigenclass.send :define_method, method_name, &blk
  end

  def eigenmethod(method_name)
    eigenclass.instance_method(method_name)
  end
end
