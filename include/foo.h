#ifndef FOO_H_
#define FOO_H_

#include <stddef.h>
#include <stdbool.h>

bool
fooAdd(int x, int y, int z, int * destination);

bool
stringToBool(const char*, bool * destination);

#endif
