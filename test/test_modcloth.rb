require 'helper'

class TestModcloth < Test::Unit::TestCase
  
  should "Numeric respond to closest_fibonacci" do
    assert Numeric.instance_methods.include?(:closest_fibonacci) || Numeric.instance_methods.include?('closest_fibonacci')
  end
  
  should "raise ArgumentError for negative numbers" do
    assert_raise(ArgumentError, 'the Fibonacci Sequence does not contain negative numbers') {-1.closest_fibonacci}
  end
  
  should "return zero as first Fibonacci number for 0 and 0.0" do
    assert_equal 0, 0.0.closest_fibonacci
    assert_equal 0, 0.closest_fibonacci
  end
  
  should "return same number for Fibonacci numbers" do
    assert_equal 3, 3.0.closest_fibonacci
    assert_equal 3, 3.closest_fibonacci
    assert_equal 10946, 10946.closest_fibonacci
  end
  
  should "not return Fibonacci number that is larger than itself" do
    [11000, 312909312, 101020029092, 718910020902393499].each { |e|
      assert e >= e.closest_fibonacci
    }
  end
  
  
end
