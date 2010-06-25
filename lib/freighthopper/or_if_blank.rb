class Object  
  def or_if_blank(val = nil)
    if soft_send :blank?
      val || (block_given? ? yield : nil)
    else
      self
    end
  end
end
