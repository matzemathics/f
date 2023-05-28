
#include <time.h>
#include <stdio.h>

int main(int argc, const char *args[])
{
    const char spinner[] = {
        '-', '\\', '|', '/'
    };

    for ( int i = 0; i < 12; i++ )
    {
        fprintf(stderr, "\r%c Paying respect ...", spinner[i % sizeof(spinner)]);
        // from https://stackoverflow.com/questions/7684359/how-to-use-nanosleep-in-c-what-are-tim-tv-sec-and-tim-tv-nsec#7684384
        nanosleep((const struct timespec[]){{0, 100000000L}}, NULL);
    }

    // from https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
    const char *green_bold = "\033[32;1m";
    const char *reset = "\033[0m";

    fprintf(stderr, "\r%sOk%s Respect payed successfully\n", green_bold, reset);

    return 0;
}