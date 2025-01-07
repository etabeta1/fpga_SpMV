#include "SpMV.hpp"

void SpMV(
    int values[MAX_MATRIX_ELEMENTS],
    ColumnIndex columnIndexes[MAX_MATRIX_ELEMENTS],
    RowPointer rowPointers[MAX_MATRIX_SIDE_SIZE + 1],

    VectorSize numOfRows,
    VectorSize numOfCols,

    int vector[MAX_MATRIX_SIDE_SIZE],

    int output[MAX_MATRIX_SIDE_SIZE]
) {
    spmv_loop_external:for(VectorSize i = 0; i < MAX_MATRIX_SIDE_SIZE; i++) {
        #pragma HLS UNROLL

        int sum = 0;

        if(i < numOfRows) {
            
            spmv_loop_internal:for(ValuesSize j = rowPointers[i]; j < rowPointers[i + 1]; j++) {
                #pragma HLS PIPELINE II=1

                int matrix_value = values[j];
                
                ColumnIndex column_index = columnIndexes[j];

                int vector_value = vector[column_index];
                
                int temp = matrix_value * vector_value;
                sum += temp;
            }

        }
        
        output[i] = sum;
    }
};