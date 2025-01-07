#include "testcase.hpp"

Testcase::Testcase(std::istream& is) {
    values = nullptr;
    columnIndexes = nullptr;
    rowPointers = nullptr;
    vector = nullptr;
    target = nullptr;
    output = nullptr;

    is >> name >> numOfRows >> numOfCols;
    
    ValuesSize vs;
    is >> vs;

    values = (int*) malloc(vs * sizeof(int));

    for(ValuesSize i = 0; i < vs; i++) {
        is >> values[i];
    }

    columnIndexes = (ColumnIndex*) malloc(vs * sizeof(ap_int<32>));

    for(ValuesSize i = 0; i < vs; i++) {
        is >> columnIndexes[i];
    }

    rowPointers = (RowPointer*) malloc((numOfRows + 1) * sizeof(RowPointer));

    for(RowPointersSize i = 0; i < numOfRows + 1; i++) {
        is >> rowPointers[i];
    }

    vector = (int*) malloc(numOfCols * sizeof(int));

    for(VectorSize i = 0; i < numOfCols; i++) {
        is >> vector[i];
    }

    target = (int*) malloc(MAX_MATRIX_SIDE_SIZE * sizeof(int));

    for(VectorSize i = 0; i < numOfRows; i++) {
        is >> target[i];
    }
    for(VectorSize i = numOfRows; i < MAX_MATRIX_SIDE_SIZE; i++) {
        target[i] = 0;
    }

    output = (int*) malloc(MAX_MATRIX_SIDE_SIZE * sizeof(int));

    for(int i = 0; i < MAX_MATRIX_SIDE_SIZE; i++) {
        output[i] = 0;
    }

    assert(values != nullptr);
    assert(columnIndexes != nullptr);
    assert(rowPointers != nullptr);
    assert(vector != nullptr);
    assert(target != nullptr);
    assert(output != nullptr);

    assert(rowPointers[numOfRows] == vs);
}

Testcase::~Testcase() {
    free(values);
    free(columnIndexes);
    free(rowPointers);
    free(vector);
    free(target);
    free(output);
}

bool Testcase::run(std::ostream &os) {
    os << "Running test \'" << name << "\'...";

    SpMV(values, columnIndexes, rowPointers, numOfRows, /* numOfCols, */ vector, output);

    if(check()) {
        os << "OK" << std::endl;
        return true;
    } else {
        os << "ERROR: got ";
        for(VectorSize i = 0; i < numOfRows; i++) {
            os << output[i] << " ";
        }
        os << std::endl;
        return false;        
    }
}

bool Testcase::check() {

    for(VectorSize i = 0; i < numOfRows; i++) {
        if(output[i] != target[i])
            return false;
    }
    return true;
}