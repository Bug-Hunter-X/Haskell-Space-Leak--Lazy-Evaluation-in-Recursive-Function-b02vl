The solution uses `$!` (bang patterns) to force strict evaluation of intermediate results. This ensures the garbage collector can reclaim memory after each recursive step, preventing the space leak.

```haskell
calculate :: Int -> Int
calculate 0 = 0
calculate n = n + (calculate (n - 1) `seq` (calculate (n - 1)))

--Alternative solution using seq
--calculate :: Int -> Int
--calculate 0 = 0
--calculate n = n `seq` (n + calculate (n - 1))
```
This ensures that the intermediate results of `calculate` are evaluated and their memory released before the next recursive call.