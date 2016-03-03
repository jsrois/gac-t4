class Foo
{
public:
	int sum(int a, int b) 
	{		
		int acc = a;			
		for (int i = 0; i< abs(b);i++)
		{
			acc++;
		}
		return acc;
	}
};
