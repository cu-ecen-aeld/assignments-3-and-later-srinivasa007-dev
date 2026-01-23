#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
    if (argc != 3) {
        openlog("writer", LOG_PID, LOG_USER);
        syslog(LOG_ERR, "Invalid number of arguments");
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    openlog("writer", LOG_PID, LOG_USER);

    FILE *fp = fopen(writefile, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "Error opening file %s: %s", writefile, strerror(errno));
        closelog();
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    if (fprintf(fp, "%s", writestr) < 0) {
        syslog(LOG_ERR, "Error writing to file %s", writefile);
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);
    closelog();

    return 0;
}
