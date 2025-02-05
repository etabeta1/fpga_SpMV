// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
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

#define CONTROL_ADDR_AP_CTRL            0x00
#define CONTROL_ADDR_GIE                0x04
#define CONTROL_ADDR_IER                0x08
#define CONTROL_ADDR_ISR                0x0c
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
