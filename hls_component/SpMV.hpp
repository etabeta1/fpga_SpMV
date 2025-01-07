#ifndef __SPMV_H__
#define __SPMV_H__

#include <ap_int.h>

// To index a 10x10 matrix, you need at least 4 bits per side
#define IDX_BITS 4
#define MAX_MATRIX_SIDE_SIZE 10
#define MAX_MATRIX_ELEMENTS (MAX_MATRIX_SIDE_SIZE * MAX_MATRIX_SIDE_SIZE)

#if MAX_MATRIX_SIDE_SIZE > (1 << IDX_BITS)
#error "Not enough bits"
#endif

typedef ap_uint<IDX_BITS + 1> ColumnIndex;
typedef ap_uint<2 * IDX_BITS + 1> ValuesSize;
typedef ap_uint<2 * IDX_BITS + 1> RowPointer;
typedef ap_uint<IDX_BITS + 1> RowPointersSize;
typedef ap_uint<IDX_BITS + 1> VectorSize;

const int values_depth = MAX_MATRIX_ELEMENTS;
const int columnIndexes_depth = MAX_MATRIX_ELEMENTS;
const int rowPointers_depth = MAX_MATRIX_SIDE_SIZE + 1;
const int vector_depth = MAX_MATRIX_SIDE_SIZE;
const int output_depth = MAX_MATRIX_SIDE_SIZE;

void SpMV(
    int values[MAX_MATRIX_ELEMENTS],
    ColumnIndex columnIndexes[MAX_MATRIX_ELEMENTS],
    RowPointer rowPointers[MAX_MATRIX_SIDE_SIZE + 1],

    VectorSize numOfRows,
    VectorSize numOfCols,

    int vector[MAX_MATRIX_SIDE_SIZE],

    int output[MAX_MATRIX_SIDE_SIZE]
);

#endif