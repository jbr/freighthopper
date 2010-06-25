class Object
  def soft_send(method, *args)
    send method, *args if respond_to? method
  end
end
