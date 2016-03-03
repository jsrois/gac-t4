require 'erb'
class GMockSerializer
	def serialize_expectation(expectation)
		"EXPECT SOMETHING HERE"	
	end
	def serialize_precondition(precondition)
		"SOME ASSIGNMENT OR CALL"
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
    }
  end

  def run (test_suite)
    template = ERB.new(get_template)
    template.result(binding)
  end
end
