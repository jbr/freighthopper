require File.instance_eval { expand_path join(dirname(__FILE__), '..', 'vendor', 'gems', 'environment')}
Bundler.require_env :test

$:.unshift File.instance_eval { expand_path join(dirname(__FILE__), "..", "lib") }
require 'test/unit'


class Test::Unit::TestCase
  include TestRig
end
