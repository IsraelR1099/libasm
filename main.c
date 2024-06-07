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


	int ret = ft_write(-1, "hola\n", 5);
	if (ret < 0)
		printf("error is: %s\n", strerror(errno));
	printf("value ret: %d\n", ret);

	ret = write(1, "hola\n", 5);
	if (ret < 0)
		printf("error write is: %s\n", strerror(errno));
	printf("value ret: %d\n", ret);


	printf("###############################################\n");
	printf("#FT_READ\n");
	printf("###############################################\n");


	int	fd2 = open("hola.txt", O_RDONLY);
	if (fd2 < 0)
		perror("error ft_read: ");
	char	buf2[20] = {0};
	int		reabyte = ft_read(-1, buf2, 2);
	if (reabyte < 0)
		printf("ft read error %s\n", strerror(errno));
	else
	{
		buf2[2] = '\0';
		printf("reabytes es %d y buf2 %s\n", reabyte, buf2);
	}

	int fd = open("hola.txt", O_RDONLY);
	if (fd < 0)
		perror("error read: ");
	char buf[20] = {0};
	int rbytes = read(fd, buf, 2);
	if (rbytes < 0)
		printf("read error %s\n", strerror(errno));
	else
	{
		buf[2] = '\0';
		printf("rbytes es %d y buf %s\n", rbytes, buf);
	}

	return (0);
}
