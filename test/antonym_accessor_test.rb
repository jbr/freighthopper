require File.instance_eval { expand_path join(dirname(__FILE__), 'test_helper') }
require 'freighthopper'


class TestClass
  def private?() @private end
  def private=(p) @private = p end
end

class TwoArgumentForm < TestClass
  antonym_accessor :private, :public
end

class HashForm < TestClass
  antonym_accessor :private => :public
end

class ArrayTest < Test::Unit::TestCase
  def self.should_act_like_antonym_accessor
    should 'define a public= method' do
      @instance.public = true
      assert_not @instance.private?
    end

    should 'define a public? method' do
      @instance.private = false
      assert @instance.public?
    end
  end

  context 'two argument form' do
    setup {@instance = TwoArgumentForm.new}
    should_act_like_antonym_accessor
  end

  context 'hash form' do
    setup {@instance = HashForm.new}
    should_act_like_antonym_accessor
  end

  context 'anything else' do
    should 'raise' do
      begin
        TestClass.antonym_accessor :foo
      rescue => e
       assert e.message =~ /antonym_accessor expects/
      ensure
        assert_not_nil e
      end
    end
  end
end
