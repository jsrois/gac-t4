require 'erb'
class GMockSerializer
  def get_template()
    %{#include <gmock/gmock.h>
#include <%= test_suite.file %>

<% test_suite.test_cases.each do |test_case| %>
TEST_F(TestSuite, <%=test_case.name%>)
{
 EXPECT_EQ(true,true);
}
<% end %>

    }
  end

  def run (test_suite)
    template = ERB.new(get_template)
    template.result(binding)
  end
end
