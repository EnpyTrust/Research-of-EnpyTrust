#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <sys/stat.h>

// Function to check if a file has already been downloaded
int is_file_downloaded(const char *filename) {
    struct stat buffer;
    return (stat(filename, &buffer) == 0);
}

// Function to download a file using libcurl
void download_file(const char *url, const char *output_file) {
    CURL *curl = curl_easy_init();
    if (curl) {
        FILE *fp = fopen(output_file, "wb");
        if (!fp) {
            fprintf(stderr, "Failed to open file %s for writing.\n", output_file);
            curl_easy_cleanup(curl);
            return;
        }

        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
        curl_easy_setopt(curl, CURLOPT_FAILONERROR, 1L);

        CURLcode res = curl_easy_perform(curl);
        if (res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        } else {
            printf("Downloaded: %s\n", output_file);
        }

        fclose(fp);
        curl_easy_cleanup(curl);
    }
}

int main() {
    const char *repo_url = "https://raw.githubusercontent.com/EnpyTrust/Research-of-EnpyTrust/main/";
    const char *txt_files[] = {
        "file1.txt", // Replace with actual .txt filenames in the repo
        "file2.txt",
        // Add more filenames as needed
    };
    int txt_files_count = sizeof(txt_files) / sizeof(txt_files[0]);

    for (int i = 0; i < txt_files_count; ++i) {
        const char *filename = txt_files[i];
        if (!is_file_downloaded(filename)) {
            char file_url[512];
            snprintf(file_url, sizeof(file_url), "%s%s", repo_url, filename);

            download_file(file_url, filename);
        } else {
            printf("File %s already downloaded.\n", filename);
        }
    }

    return 0;
}
