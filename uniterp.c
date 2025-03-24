#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void execute_file(const char *filepath) {
    const char *extension = strrchr(filepath, '.');

    if (!extension) {
        printf("Error: No file extension found.\n");
        return;
    }

    if (strcmp(extension, ".py") == 0) {
        // Execute Python script
        char command[256];
        snprintf(command, sizeof(command), "python %s", filepath);
        system(command);
    } else if (strcmp(extension, ".c") == 0) {
        // Compile and execute C file
        char command[256];
        snprintf(command, sizeof(command), "gcc %s -o temp && ./temp && rm temp", filepath);
        system(command);
    } else if (strcmp(extension, ".pl") == 0) {
        // Execute Perl script
        char command[256];
        snprintf(command, sizeof(command), "perl %s", filepath);
        system(command);
    } else if (strcmp(extension, ".cpp") == 0) {
        // Compile and execute C++ file
        char command[256];
        snprintf(command, sizeof(command), "g++ %s -o temp && ./temp && rm temp", filepath);
        system(command);
    } else {
        printf("Error: Unsupported file extension '%s'.\n", extension);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <file_path>\n", argv[0]);
        return 1;
    }

    execute_file(argv[1]);
    return 0;
}
