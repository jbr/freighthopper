require File.instance_eval { expand_path join(dirname(__FILE__), 'test_helper') }
require 'freighthopper'

class ArrayTest < Test::Unit::TestCase
  context 'inverse_grep' do
    should 'exclude anything that === matches the pattern' do
      assert_equal (6..10).to_a, (1..10).inverse_grep(1..5)
    end

    should 'map with the block if provided' do
      start    = %w( monday tuesday wednesday thursday friday saturday sunday )
      expected = %w( Monday Tuesday Wednesday Thursday Friday )
      
      assert_equal expected, start.inverse_grep(/^s/){|day| day.titlecase}
    end
  end

  context 'symbols' do
    should 'map to sym' do
      assert_equal [:a, :b, :c, :d, :e], %w( a b c d e ).symbols
    end
  end
  
  context 'exclude' do
    should 'return false if the array includes the element' do
      assert_not %w(a b c).exclude?('b')
    end
    
    should 'return true if the array does not include the element' do
      assert %w(a b c).exclude?('z')
    end
  end
  
  context 'singular' do
    should 'return the singular object if there is indeed only one' do
      assert_singular 5, [5]
    end
    
    should 'return nil if the array is empty' do
      assert_singular nil, []
    end
    
    should 'return nil if the array has > 1 item' do
      assert_singular nil, [1, 2]
    end
  end
  
  context 'singular questionmark' do
    should 'return true if the array has only one member' do
      assert_singular [5]
    end
    
    should 'return false if the array is empty' do
      assert_not_singular []
    end
    
    should 'return false if the array has more than one member' do
      assert_not_singular [1, 2]
    end
  end
  
  context 'singular bang' do
    should 'return the item if there is just one' do
      assert_equal 5, [5].singular!
    end
    
    should 'raise if there are no items' do
      e = assert_raise(RuntimeError){ [].singular! }
      assert_message 'not singular', e
    end

    should 'raise if there are more than one item' do
      e = assert_raise(RuntimeError){ [1, 2].singular! }
      assert_message 'not singular', e
    end
  end
end
