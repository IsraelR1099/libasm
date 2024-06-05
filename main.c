#include "libasm.h"


int	main(void)
{
	char	*str = "Hel\0lo, World!";
	char	*str2 = "\t\n\v\f\r";
	printf("ft_strlen: %zu\n", ft_strlen(str));
	printf("strlen: %zu\n", strlen(str));
	printf("ft_strlen: %zu\n", ft_strlen(str2));
	printf("strlen: %zu\n", strlen(str2));
	
	char dest[20];
	char src[20] = "hola";
	printf("ft_strcpy: %s\n", ft_strcpy(dest, src));

	char dest2[20];
	char src2[20] = "hola";
	printf("strcpy: %s\n", strcpy(dest2, src2));

	const char *s1 = "hola";
	const char *s2 = "hola";
	printf("ft_strcmp: %d\n", ft_strcmp(s1, s2));
	printf("strcmp: %d\n", strcmp(s1, s2));

	return (0);
}
