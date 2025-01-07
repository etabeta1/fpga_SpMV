import numpy as np

"""
Modify the size and the seed, then run the script to generate a new test case.
"""

SIZE = (10, 10)
np.random.seed(42)

LIMIT = 11585 # In the fpga implementation, the matrix' size can go up to 16x16, this number is the masimum number that prevents overflow


zerouno = np.random.randint(2, size=SIZE)
matrice = np.random.randint(2 * LIMIT, size=SIZE) - LIMIT

res = np.multiply(zerouno, matrice)

vettore = np.random.randint(2 * LIMIT, size=SIZE[1]) - LIMIT

target = np.dot(res, vettore)

values = []
columnIndexes = []
rowPointers = [0]

for i in range(SIZE[0]):
    for j in range(SIZE[1]):
        if res[i][j] != 0:
            values.append(res[i][j])
            columnIndexes.append(j)
    rowPointers.append(len(values))

name = np.base_repr(np.random.randint(0xffffffff, dtype=np.int64), base=16)

def print_vector(v, end=""):
    for i in v:
        print(i, end=" ")
    print(end)

print(f"test_{name}")
print(SIZE[0], SIZE[1])
print(len(values))
print_vector(values)
print_vector(columnIndexes)
print_vector(rowPointers, len(values))
print_vector(vettore)
print_vector(target)
