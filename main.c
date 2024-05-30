#include "libasm.h"


int	main(void)
{
	char	*str = "Hel\0lo, World!";
	char	*str2 = "\t\n\v\f\r";
	printf("ft_strlen: %zu\n", ft_strlen(str));
	printf("strlen: %zu\n", strlen(str));
	printf("ft_strlen: %zu\n", ft_strlen(str2));
	printf("strlen: %zu\n", strlen(str2));
	return (0);
}
