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

example : 1 + 1 = 2 := by
  calc
    1 + 1 = 1 + Nat.succ 0   := rfl
    _     = Nat.succ (1 + 0) := rfl
    _     = Nat.succ 1       := by rw [add_zero]
    _     = 2                := rfl
