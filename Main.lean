    --                     [A5] n + m = m + n   (加法交换律)
    --                      ↑
    --                 ┌────┴────┐
    --              [A3]         [A4]
    --     (succ 加法右结合)   (0 + n = n)
    --           ↑              ↑
    --          [A1]           [A2]
    --  (succ n + m = succ (n + m))   (n + 0 = n)


theorem add_zero (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

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

theorem succ_add (n m : Nat) : Nat.succ n + m = Nat.succ (n + m) := by
  rw [Nat.succ_add]

theorem add_succ (n m : Nat) : n + Nat.succ m = Nat.succ (n + m) := by
  induction n with
  | zero =>
    calc
      0 + Nat.succ m = Nat.succ m       := by rw [zero_add]
      _              = Nat.succ (0 + m) := by rw [zero_add]
  | succ k ih =>
    calc
      Nat.succ k + Nat.succ m = Nat.succ (k + Nat.succ m)   := by rw [succ_add]
      _                       = Nat.succ (Nat.succ (k + m)) := by rw [ih]
      _                       = Nat.succ (Nat.succ k + m)   := by rw [succ_add]

theorem add_comm (n m : Nat) : n + m = m + n := by
  induction n with
  | zero =>
    calc
      0 + m = m     := by rw [zero_add]
      _     = m + 0 := by rw [add_zero]
  | succ k ih =>
    calc
      Nat.succ k + m = Nat.succ (k + m) := by rw [succ_add]
      _              = Nat.succ (m + k) := by rw [ih]
      _              = m + Nat.succ k   := by rw [add_succ]
