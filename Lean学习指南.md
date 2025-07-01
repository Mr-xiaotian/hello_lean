## 🧰 Lean 常用 tactic 简介表

| tactic 名           | 中文解释                                    | 常见用途                     | 示例                      |
| ------------------ | --------------------------------------- | ------------------------ | ----------------------- |
| `rfl`              | reflexivity，自反性                         | 证明 `x = x` 或定义等价         | `rfl` 证明 `n + 0 = n`    |
| `rw [h]`           | rewrite，用某个等式 `h : A = B` 把目标里的 A 替换成 B | 简单变形，利用已知等式              | `rw [add_zero]`         |
| `simp`             | simplify，自动简化表达式（使用很多内置等式）              | 快速清理目标、证明简单目标            | `simp`、`simp [Nat.add]` |
| `induction n with` | 数学归纳法                                   | 对自然数/递归结构进行归纳            | `induction n with`      |
| `calc`             | 等式链推理                                   | 多步等式证明                   | `calc ... := ...`       |
| `exact h`          | 明确指定证明目标就是 `h`                          | 目标和 `h` 完全一致时使用          | `exact ih`              |
| `apply h`          | 用一个定理/引理 `h` 来证明当前目标                    | 目标是 `结论`，`h` 是 `前提 → 结论` | `apply some_lemma`      |
| `intro x`          | 引入一个前提变量                                | 目标是 `∀ x, P x` 或 `A → B` | `intro n`               |
| `assumption`       | 如果上下文中已有该结论，直接使用它                       | 自动找到匹配的假设                | `assumption`            |
| `have`             | 声明一个中间结论（辅助引理）                          | 构造中间步骤                   | `have h : A := ...`     |
| `cases h with`     | 对一个构造类型（如布尔值、和类型）进行分类讨论                 | 分析 if/Option 等情况         | `cases h with`          |

