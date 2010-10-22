module Enumerable
  def inverse_grep(pattern, &blk)
    inject([]) do |accumulator, value|
      unless pattern === value
        accumulator << (blk ? blk.call(value) : value)
      end
      accumulator
    end
  end
end
