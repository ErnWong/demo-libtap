#include <stdio.h>
#include "bar.h"
#include "foo.h"

int main()
{
    puts("Hi");
    Bar * a = barNew(1, 2, 3, "surpise");
    Bar * b = barNew(1, 3, 4, "embedded");
    Bar * c = barNew(2, 2, 3, "deep");
    Bar * d = barNew(1, 4, 4, "inside");
    Bar * e = barNew(1, 1, 2, "is");
    Bar * f = barNew(1, 2, 2, "not");
    barAdd(b, a);
    barAdd(c, a);
    barAdd(d, a);
    barAdd(e, a);
    barAdd(f, a);
    int size;
    fooAdd(1, 3, 4, &size);
    printf("The secret for (1, 3, 4) is %s\n", barFind(size, a));
    fooAdd(1, 1, 2, &size);
    printf("The secret for (1, 1, 2) is %s\n", barFind(size, a));
    fooAdd(2, 2, 3, &size);
    printf("The secret for (2, 2, 3) is %s\n", barFind(size, a));
    fooAdd(4, 2, 3, &size);
    printf("The secret for (4, 2, 3) is %s\n", barFind(size, a));
    puts("Bye");
}
