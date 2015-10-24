#include "foo.h"

#include <stddef.h>
#include <string.h>

bool
fooAdd(int x, int y, int z, int * dest)
{
    if (dest == NULL) return false;
    *dest = x + y;
    return true;
}

bool
stringToBool(const char * string, bool * dest)
{
    if (strcmp(string, "true") == 0)
    {
        *dest = true;
        return true;
    }
    if (strcmp(string, "false") == 0)
    {
        *dest = false;
        return true;
    }
    return false;
}
