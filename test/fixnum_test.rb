require File.expand_path("../test_helper", __FILE__)
require 'freighthopper/fixnum'

class FixnumTest < Test::Unit::TestCase
  context 'of' do
    should 'give me five of what the block returns' do
      assert_equal %w(hello hello), 2.of { "hello" }
    end

    should 'yield the index' do
      assert_equal %w( 0 1 2 3 ), 4.of {|i| i.to_s }
    end
  end
end
