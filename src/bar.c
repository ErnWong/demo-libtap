#include "bar.h"

#include <stdlib.h>
#include <stddef.h>
#include "foo.h"

struct Bar
{
    int x;
    int y;
    int z;
    const char * secret;
    Bar * next;
    Bar * prev;
};

static Bar ** findBar(int size, Bar * tree);
static int getSize(Bar*);

Bar *
barNew(int x, int y, int z, const char * secret)
{
    Bar * bar = malloc(sizeof(Bar));
    bar->x = x;
    bar->y = y;
    bar->z = z;
    bar->secret = secret;
    bar->next = NULL;
    bar->prev = NULL;
    return bar;
}

void
barAdd(Bar * bar, Bar * tree)
{
    Bar ** location = findBar(getSize(bar), tree);
    *location = bar;
}

const char *
barFind(int size, Bar * tree)
{
    Bar ** bar  = findBar(size, tree);
    return (*bar)->secret;
}

static Bar **
findBar(int size, Bar * tree)
{
    Bar ** visit = &tree;
    while (visit != NULL)
    {
        int visitSize = getSize(*visit);
        if (size == visitSize) return visit;
        if (size > visitSize) visit = &(*visit)->next;
        if (size < visitSize) visit = &(*visit)->prev;
    }
    return visit;
}

static int
getSize(Bar * bar)
{
    return fooAdd(bar->x, bar->y, bar->z);
}
