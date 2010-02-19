require 'test/unit'

begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

Bundler.require :default, :test

$:.unshift File.instance_eval { expand_path join(dirname(__FILE__), "..", "lib") }


class Test::Unit::TestCase
  include TestRig
end
