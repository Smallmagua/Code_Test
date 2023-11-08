#include <stdio.h>

int main()
{
	float sum = 0;
	int n = 1;
	while (sum < 5)
	{
		sum = sum + 1.0 / n;
		++n;
	}
	printf("×îĞ¡Öµ£º%d\n", n);

	return 0;
}
