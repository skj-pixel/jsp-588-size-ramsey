# JSP-000588 — Two-color size Ramsey numbers of paths and cycles

## Problem
How fast do the two-color size Ramsey numbers of prescribed paths and
cycles grow?

References:
- [EFRS78b] Erdős, Faudree, Rousseau, Schelp — "The size Ramsey number"
  Period. Math. Hungar. (1978), 145-161.
- [Be83b] Beck — "On size Ramsey number of paths, trees, and circuits. I"
  J. Graph Theory (1983), 115-129.

## Status
The exact asymptotic is f̂(R(n; P_n), P_n) = (1 + o(1)) · 4n (Beck 1983
for paths; similarly for cycles). This scaffold captures the outer
statement on a `Finset ℕ` vertex carrier, leaving the main theorem
as `sorry`.

## Build
```
cd D:\evox-main\JustinSunPrize\jsp-588-size-ramsey
lake build
```