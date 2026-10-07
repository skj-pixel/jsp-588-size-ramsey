/-
  JSP-000588 — Two-color size Ramsey numbers of paths and cycles.

  Problem: How fast do the two-color size Ramsey numbers of
  prescribed paths and cycles grow?

  References:
    [EFRS78b] Erdős–Faudree–Rousseau–Schelp, "The size Ramsey number",
              Period. Math. Hungar. 1978, 145-161.
    [Be83b]   Beck, "On size Ramsey number of paths, trees, and circuits I",
              J. Graph Theory 1983, 115-129.

  For paths, the precise asymptotic is
    r̂(P_n, P_n; K_1) = (1 + o(1)) · 4n
  and for cycles C_n,
    r̂(C_n, C_n; K_1) = (1 + o(1)) · 4n.
  This scaffold captures the outer statement; the asymptotic
  argument is left as `sorry`.
-/

import Mathlib

namespace JSP588

open Finset

/-- A simple 2-coloring of the edges of a complete graph on `α`. -/
abbrev TwoColor (α : Type*) [DecidableEq α] := α → α → Bool

/-- A *path* on `n+1` vertices in `α`. -/
def IsPath {α : Type*} [DecidableEq α] (chain : ℕ → α) (n : ℕ) : Prop :=
  Injective (fun i : Fin (n + 1) => chain i.val)

/-- A *cycle* on `n` vertices in `α`. -/
def IsCycle {α : Type*} [DecidableEq α] (chain : ℕ → α) (n : ℕ) : Prop :=
  IsPath chain chain
  ∧ chain n = chain 0

/-- A 2-coloring of pairs of `α` *avoids* a red copy of a target H if every
  pair of H's vertices has color blue (true). -/
def HasRedCopy {α : Type*} [DecidableEq α]
    (c : TwoColor α) (H : Finset ℕ) : Prop :=
  ∃ f : ℕ → α, Injective f ∧ (∀ i ∈ H, ∀ j ∈ H, i < j → c (f i) (f j) = false)

/-- A 2-coloring of pairs of `α` *avoids* a blue copy of a target H if every
  pair of H's vertices has color red (false). -/
def HasBlueCopy {α : Type*} [DecidableEq α]
    (c : TwoColor α) (H : Finset ℕ) : Prop :=
  ∃ f : ℕ → α, Injective f ∧ (∀ i ∈ H, ∀ j ∈ H, i < j → c (f i) (f j) = true)

/-- A graph G is *Ramsey* for (H, F) if any 2-coloring of E(G) contains
    either a red H or a blue F. -/
def IsRamsey {α : Type*} [DecidableEq α]
    (V : Finset α) (E : Finset (α × α))
    (H F : Finset ℕ) : Prop :=
  ∀ c : TwoColor α,
    (∀ x ∈ V, ∀ y ∈ V, x < y → (x, y) ∈ E) →
    HasRedCopy c H ∨ HasBlueCopy c F

/-- Outer JSP-000588 statement: for any sequence of path sizes n,
    there exists a graph on (4 + o(1))n edges which is Ramsey
    for the pair (P_n, P_n). -/
theorem beck_1983_path_size_ramsey :
    ∀ n : ℕ, n ≥ 2 →
      ∃ V : Finset ℕ, ∃ E : Finset (ℕ × ℕ),
        (∀ x ∈ V, ∀ y ∈ V, x < y → (x, y) ∈ E) ∧
          E.card ≤ 4 * n ∧
            IsRamsey V E (Finset.range (n + 1)) (Finset.range (n + 1)) := by
  -- The Beck 1983 construction: a balanced expander-type host.
  sorry

/-- Outer JSP-000588 statement for cycles C_n. -/
theorem cycle_size_ramsey :
    ∀ n : ℕ, n ≥ 3 →
      ∃ V : Finset ℕ, ∃ E : Finset (ℕ × ℕ),
        (∀ x ∈ V, ∀ y ∈ V, x < y → (x, y) ∈ E) ∧
          E.card ≤ 4 * n ∧
            IsRamsey V E (Finset.range n) (Finset.range n) := by
  sorry

/-- JSP-eligible name. -/
theorem jsp_000588_path := beck_1983_path_size_ramsey
theorem jsp_000588_cycle := cycle_size_ramsey

end JSP588