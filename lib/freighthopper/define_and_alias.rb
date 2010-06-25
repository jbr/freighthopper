require 'active_support'

class Module
  def define_and_alias(target, feature, &blk)
    aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
    define_method :"#{aliased_target}_with_#{feature}#{punctuation}", &blk
    alias_method_chain target, feature
  end
end
