#include "libasm.h"


int	main(void)
{
	char	*str = "Hel\0lo, World!";
	char	*str2 = "\t\n\v\f\r";

	printf("###############################################\n");
	printf("#FT_STRLEN\n");
	printf("###############################################\n");

	printf("ft_strlen: %zu\n", ft_strlen(str));
	printf("strlen: %zu\n", strlen(str));
	printf("ft_strlen: %zu\n", ft_strlen(str2));
	printf("strlen: %zu\n", strlen(str2));

	printf("###############################################\n");
	printf("#FT_STRCPY\n");
	printf("###############################################\n");
	char dest[20];
	char src[20] = "hola";
	printf("ft_strcpy: %s\n", ft_strcpy(dest, src));

	char dest2[20];
	char src2[20] = "hola";
	printf("strcpy: %s\n", strcpy(dest2, src2));

	printf("###############################################\n");
	printf("#FT_STRCMP\n");
	printf("###############################################\n");

	const char *s1 = "";
	const char *s2 = "hola como\0 estas";
	printf("ft_strcmp: %d\n", ft_strcmp(s1, s2));
	printf("strcmp: %d\n", strcmp(s1, s2));

	printf("###############################################\n");
	printf("#FT_WRITE\n");
	printf("###############################################\n");

	printf("ft_write: %zd\n", ft_write(-1, "hola\n", 5));
	printf("write: %zd\n", write(1, "hola\n", 5));

	return (0);
}
