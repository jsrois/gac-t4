require 'erb'
class GMockSerializer
	def serialize_expectation(expectation)
		%{EXPECT_EQ(#{expectation.return_value},object.#{expectation.method}(#{expectation.arguments}));}
	end
	def serialize_precondition(precondition)
		sentence = ''
    sentence = "auto #{precondition.lso} = " if precondition.lso
    sentence += "#{precondition.rso};" if precondition.rso
    sentence += "object.#{precondition.method}(#{precondition.arguments});" if precondition.method
    sentence
	end
  def get_template()
  	template_name = File.join(File.dirname(__FILE__), "template.erb")
		File.read(template_name)
  end

  def run (test_suite)
    template = ERB.new(get_template)
    template.result(binding)
  end
end
