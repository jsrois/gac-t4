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
%{#include <gmock/gmock.h>
#include <%= test_suite.file %>

class TestSuite : public ::testing::Test
{
protected:
 <%= test_suite.target_class + " object;" %>	
};

<% test_suite.test_cases.each do |test_case| %>
TEST_F(TestSuite, <%=test_case.name%>)
{
<% test_case.preconditions.each do |precondition| %>
 <%= serialize_precondition precondition %>
<% end %>
<% test_case.expectations.each do |expectation| %>
 <%= serialize_expectation expectation %>
<% end %>
}
<% end %>

int main(int argc, char ** argv)
{
    ::testing::InitGoogleMock(&argc,argv);
    return RUN_ALL_TESTS();
}
}
  end

  def run (test_suite)
    template = ERB.new(get_template)
    template.result(binding)
  end
end
