class Module  
  def lazy_alias(to, from)
    define_method(to){|*args| send from, *args}
  end
end
