#include <unistd.h>
#include <sys/stat.h>
#include <stdio.h>
#include <string.h>

int
main (int argc, char **argv)
{
	if (argc != 3) {
		printf("usage: chmod <octal-mode> <path>\n");
		return 1;
	}

	mode_t mode;
	if (sscanf(argv[1], "%o", &mode) != 1)
		return 1;

	if (chmod(argv[2], mode) < 0)
		return 1;

	return 0;
}
