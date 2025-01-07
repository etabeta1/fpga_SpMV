#include "SpMV.hpp"

#include "testcase.hpp"

#include <cassert>
#include <fstream>
#include <iostream>
#include <string>

int main() {

    std::ifstream is("input.txt");

    int n;
    is >> n;

    int succ = 0;

    for(int i = 0; i < n; i++) {
        Testcase t(is);
        (t.run(std::cout) ? succ++ : 0);
    }

    return (n == succ ? 0 : 1);

    return 0;
}
