# This file contains the actual 'core extension' to the Numeric core library class to calculate the closest (smaller) Fibonacci number
class Numeric 
  #:stopdoc:
  # class variable serves for memoization of the fibonacci sequence's numbers calculated so far
  @@fibonacci_sequence = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]
  #:startdoc:
  
  # Return largest integer value from the Fibonacci sequence smaller or equal to the given Numeric instance. 
  # Note: an ArgumentError is raised when the Numeric instance is negative.
  #
  # Examples:
  #     144.closest_fibonacci   #=> 144
  #     156.closest_fibonacci   #=> 144
  #     99.closest_fibonacci    #=> 89
  #     2.999.closest_fibonacci #=> 2
  #     -1.closest_fibonacci    #=> ArgumentError: the Fibonacci Sequence does not contain negative numbers
  def closest_fibonacci
    # throw an exception for negative numbers
    raise ArgumentError, 'the Fibonacci Sequence does not contain negative numbers' if self < 0
    # early exist for 0
    return 0 if self == 0
    # first, look up the closest Fibonacci number in the memoized calls variable
    @@fibonacci_sequence.each_with_index { |e, i| 
      # exit and return the closest Fibonacci number if  
      return @@fibonacci_sequence[i-1] if e > self
    } 
    # populate the Fibonacci sequence class variable up to the first one that is larger than this Numeric instance
    begin 
      @@fibonacci_sequence << @@fibonacci_sequence.last(2).inject(:+)
    end while @@fibonacci_sequence.last <= self
    # return the second from last Fibonnaci number in the sequence calculated so far
    @@fibonacci_sequence.last(2).first
  end  
end