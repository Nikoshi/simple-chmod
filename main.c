#include <unistd.h>
#include <sys/stat.h>
#include <stdio.h>

int
main (int argc, char **argv)
{
	if (argc != 3) {
		printf("usage: chmod <octal-mode> <path>\n");
		return 1;
	}

	// Get mode from ocal
	mode_t mode;
	if (sscanf(argv[1], "%o", &mode) != 1)
		return 1;

	// Try to change mode
	if (chmod(argv[2], mode) < 0)
		return 1;
	
	return 0;
}
