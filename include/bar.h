#ifndef BAR_H_
#define BAR_H_

struct Bar;
typedef struct Bar Bar;

Bar *
barNew(int x, int y, int z, const char * secret);

void
barAdd(Bar*, Bar * tree);

const char *
barFind(int size, Bar * tree);

#endif
