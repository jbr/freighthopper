class Object  
  def is_one_of?(*args)
    args.flatten.any?{|arg| arg === self }
  end
end
