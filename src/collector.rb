require 'test_suite'

class ParsedLine
  attr_reader :params
  def initialize params
    @params = params
  end
end

class InvalidLine < ParsedLine;end
class SetupLine < ParsedLine;end
class NewTestCase < ParsedLine;end



def parse_line line
  regex_array = {
      'SetupLine' => %r{From class (?<target_class>[^\s]+) in (?<file>".+")}, #setup
      'NewTestCase' => %r{Assert that (?<test_case_name>[^\n]+)} #reading test cases
  }
  regex_array.each do |key,value|
    m = value.match line
    if m then
      line_class = Object.const_get(key) # these two lines are very cool
      parsed_line = line_class.new Hash[ m.names.zip( m.captures ) ]
      return parsed_line
    end
  end
  InvalidLine.new Hash.new
end

class State
  def update input, context;  end
end

class InitialState < State
  def update (input, context)
    if input.class == SetupLine
      context.test_suite.target_class = input.params["target_class"]
      context.test_suite.file = input.params["file"]
      next_state = AddingTestCases.new
    else
      next_state = InitialState.new
    end
    next_state
  end
end

def camelize(str)
  str.split(' ').map {|w| w.capitalize}.join if str
end

class AddingTestCases < State
  def update (input, context)
    next_state = AddingTestCases.new
    if input.class == NewTestCase then
      # we don't wanna lose the current test_case!
      context.test_suite.add_test_case context.current_test_case if context.current_test_case
      context.current_test_case = TestCase.new camelize(input.params["test_case_name"])
    end
    next_state
  end
end


class Collector
  attr_accessor :current_test_case
  attr_accessor :test_suite
  def initialize
    @test_suite = TestSuite.new
    @state = InitialState.new
  end

  def update_on_new_line(parsed_line)
    @state = @state.update(parsed_line, self)
  end

  # scans a file and returns the corresponding test suite
  def scan_file (file_name)
    #for each line
    File.open(file_name).each do |line|
      parsed_line = parse_line line
      raise "Invalid spec format" if  parsed_line.class == InvalidLine
      update_on_new_line parsed_line
    end
    @test_suite
  end
end