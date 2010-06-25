class String
  def strip(what = /\s/)
    gsub /^#{what}*|#{what}*$/, ''
  end
end
