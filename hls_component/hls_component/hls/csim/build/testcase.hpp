#ifndef __TESTCASE_HPP__
#define __TESTCASE_HPP__

#include "SpMV.hpp"

#include <cassert>
#include <iostream>
#include <string>

class Testcase {
    public:
        Testcase(std::istream& is);
        ~Testcase();
        bool run(std::ostream& os);
    
    private:
        std::string name;
        VectorSize numOfRows;
        VectorSize numOfCols;
        int* values;
        ColumnIndex* columnIndexes;
        RowPointer* rowPointers;
        int* vector;
        int* target;
        int* output;
        bool check();
};

#endif