

# auto LSO = RSO; "setting LSO to RSO"
# [auto LSO = ]A(); "Setting LSO to the result of calling A" / "calling A"
# [auto LSO = ]A(Args); "Setting LSO to the result of calling A with arguments (Args)"/ "calling A with arguments (Args)"
class Precondition
	attr_accessor :lso
	attr_accessor :rso
  attr_accessor :arguments
  attr_accessor :method  
  
end

class Expectation
	attr_accessor :method
	attr_accessor :return_value
	
	def initialize(method, return_value)
			@method = method
			@return_value = return_value
	end
end


class TestCase
  attr_accessor :name
  attr_accessor :preconditions
  attr_accessor :expectations

  def initialize(name)
    @name 						= name
    @preconditions 		= Array.new
    @expectations 		= Array.new
  end

end

class TestSuite
  attr_accessor :target_class
  attr_accessor :file
  attr_reader :test_cases
  def initialize
    @test_cases = []
  end
  def add_test_case(test_case)
    @test_cases << test_case
  end
end
