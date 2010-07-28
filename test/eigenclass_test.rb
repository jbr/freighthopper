require File.expand_path("../test_helper", __FILE__)
require 'freighthopper/eigenclass'

class AntonymAccessorTest < Test::Unit::TestCase
  context 'defining a method on the eigenclass' do
    setup do
      @instance = "test"
      @instance.eigenclass.send(:define_method, :reverse) { "reversed" }
    end
    
    should 'define the method on just that instance' do
      assert_reverse "reversed", @instance
    end

    should 'not define the method on any other instance' do
      assert_reverse "tset", "test"
    end
  end

  context 'the define_eigenmethod shortcut' do
    setup do
      @instance = "test"
      @instance.define_eigenmethod(:reverse) {"reversed"}
    end
    
    should 'define the method on that instance' do
      assert_reverse "reversed", @instance
    end

    should 'not define the method on any other instance' do
      assert_reverse "tset", "test"
    end

    should 'be accessible with eigenmethod' do
      assert_equal @instance.eigenclass.instance_method(:reverse),
        @instance.eigenmethod(:reverse)
    end
  end
end
