theorem add_zero (n : Nat) : n + 0 = n := by
  rfl

theorem zero_add (n : Nat) : 0 + n = n := by
  induction n with
  | zero =>
    -- base case: 0 + 0 = 0
    rfl
  | succ k ih =>
    -- inductive step: assume 0 + k = k, show 0 + (k + 1) = k + 1
    calc
      0 + Nat.succ k = Nat.succ (0 + k) := rfl
      _              = Nat.succ k       := by rw [ih]
