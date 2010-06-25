class String
  def /(num)
    scan /.{1,#{(size / num.to_f).ceil}}/
  end
end
