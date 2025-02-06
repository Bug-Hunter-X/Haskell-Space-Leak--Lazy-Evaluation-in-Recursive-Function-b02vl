# Haskell Space Leak: Lazy Evaluation in Recursive Function

This repository demonstrates a space leak in Haskell caused by lazy evaluation within a recursive function.  The `calculate` function, while simple, exhibits this problem when dealing with sufficiently large inputs. The issue arises because intermediate results are not immediately evaluated, leading to an accumulation of unevaluated thunks that consume memory.

The solution involves using strict evaluation to force the evaluation of intermediate results and prevent the space leak.

## How to reproduce:

1.  Clone this repository.
2.  Compile and run `bug.hs` with a large input value (e.g., `./bug 100000`).  Observe the potential memory consumption or program crash due to insufficient memory.
3.  Compare the memory usage/behavior with `bugSolution.hs`. 

## Solution:

The solution involves explicitly forcing the evaluation of intermediate results using `seq` or `$!`. This ensures that the garbage collector can reclaim memory as soon as possible.