class Fixnum
  def of(&blk)
    (0...self).map &blk
  end
end
