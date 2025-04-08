#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>

#define MAX_FILE_NAME 256

// Function to map a file into memory
void *map_file(const char *file_path, size_t *file_size) {
    // Open the file
    int fd = open(file_path, O_RDONLY);
    if (fd == -1) {
        perror("Failed to open file");
        return NULL;
    }

    // Get the file size
    struct stat file_stat;
    if (fstat(fd, &file_stat) == -1) {
        perror("Failed to get file stats");
        close(fd);
        return NULL;
    }
    *file_size = file_stat.st_size;

    // Map the file into memory
    void *mapped_mem = mmap(NULL, *file_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (mapped_mem == MAP_FAILED) {
        perror("Failed to map file into memory");
        close(fd);
        return NULL;
    }

    // Close the file descriptor as it's no longer needed
    close(fd);
    return mapped_mem;
}

// Function to process all .dat files in the input directory
void process_files_in_directory(const char *input_dir) {
    DIR *dir = opendir(input_dir);
    if (!dir) {
        perror("Failed to open directory");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        // Check if the file ends with ".dat"
        if (strstr(entry->d_name, ".dat") != NULL) {
            char file_path[MAX_FILE_NAME];
            snprintf(file_path, MAX_FILE_NAME, "%s/%s", input_dir, entry->d_name);

            printf("Processing file: %s\n", file_path);

            size_t file_size;
            void *mapped_data = map_file(file_path, &file_size);
            if (mapped_data != NULL) {
                // Successfully mapped, you can now process the data in mapped_data
                printf("File %s mapped to memory, size: %zu bytes\n", file_path, file_size);

                // Example processing (print first few bytes):
                for (size_t i = 0; i < (file_size < 16 ? file_size : 16); i++) {
                    printf("%02x ", ((unsigned char*)mapped_data)[i]);
                }
                printf("\n");

                // Unmap the file once done
                if (munmap(mapped_data, file_size) == -1) {
                    perror("Failed to unmap file");
                }
            }
        }
    }

    closedir(dir);
}

int main() {
    const char *input_dir = "/firmware/initramdat"; // Set your input directory path here
    process_files_in_directory(input_dir);
    return 0;
}
