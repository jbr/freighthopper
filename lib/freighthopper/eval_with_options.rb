class Object  
  def eval_with_options(*args, &blk)
    with_options *args do |map|
      map.instance_eval(&blk)
    end
  end
end
