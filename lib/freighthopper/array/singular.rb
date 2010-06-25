class Array
  def singular?() size == 1 end
  def singular() singular?? first : nil end
  def singular!() singular or raise "not singular" end
end
