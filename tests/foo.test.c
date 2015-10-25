#include <stddef.h>
#include <stdbool.h>
#include "tap.h"
#include "foo.h"

int main()
{
    plan(3);

    int sum;
    bool success = fooAdd(1, 2, 3, &sum);
    cmp_ok(sum, "==", 6, "should add properly");
    ok(success, "should return success");

    success = fooAdd(1, 2, 3, NULL);
    ok(!success, "should fail with NULL");

    done_testing();
}
