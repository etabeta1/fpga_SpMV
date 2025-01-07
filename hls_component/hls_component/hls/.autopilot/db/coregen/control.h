// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of values
//        bit 31~0 - values[31:0] (Read/Write)
// 0x14 : Data signal of values
//        bit 31~0 - values[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of columnIndexes
//        bit 31~0 - columnIndexes[31:0] (Read/Write)
// 0x20 : Data signal of columnIndexes
//        bit 31~0 - columnIndexes[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of rowPointers
//        bit 31~0 - rowPointers[31:0] (Read/Write)
// 0x2c : Data signal of rowPointers
//        bit 31~0 - rowPointers[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of numOfRows
//        bit 4~0 - numOfRows[4:0] (Read/Write)
//        others  - reserved
// 0x38 : reserved
// 0x3c : Data signal of vector
//        bit 31~0 - vector[31:0] (Read/Write)
// 0x40 : Data signal of vector
//        bit 31~0 - vector[63:32] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of output_r
//        bit 31~0 - output_r[31:0] (Read/Write)
// 0x4c : Data signal of output_r
//        bit 31~0 - output_r[63:32] (Read/Write)
// 0x50 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_VALUES_DATA        0x10
#define CONTROL_BITS_VALUES_DATA        64
#define CONTROL_ADDR_COLUMNINDEXES_DATA 0x1c
#define CONTROL_BITS_COLUMNINDEXES_DATA 64
#define CONTROL_ADDR_ROWPOINTERS_DATA   0x28
#define CONTROL_BITS_ROWPOINTERS_DATA   64
#define CONTROL_ADDR_NUMOFROWS_DATA     0x34
#define CONTROL_BITS_NUMOFROWS_DATA     5
#define CONTROL_ADDR_VECTOR_DATA        0x3c
#define CONTROL_BITS_VECTOR_DATA        64
#define CONTROL_ADDR_OUTPUT_R_DATA      0x48
#define CONTROL_BITS_OUTPUT_R_DATA      64
