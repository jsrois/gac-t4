
class Sentence
  attr_writer :return_value
  attr_writer :arguments
  attr_writer :method

  #visitor
  def serialize(serializer)
    serializer.write(@method,@arguments,@return_value)
  end
end

class TestCase
  attr_accessor :name

  def initialize name
    @name = name
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