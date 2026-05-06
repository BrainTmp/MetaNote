#import "@local/MetaNote:0.1.0": *

#show: MetaNote.with(
  title: [概率论与数理统计 第三次作业],
  author: "张三",
  date: "2026年5月6日",
  email: "zhangsan@example.com",
  preset: "homework",
  lang: "zh",
)

= 第一题

#solution[
  (a) 设 $X ~ "Bin"(n, p)$，则 $E[X] = n p$，$"Var"(X) = n p (1-p)$。由切比雪夫不等式，
  $
    P(|X - n p| >= epsilon) <= (n p (1-p)) / epsilon^2.
  $

  (b) 当 $n -> oo$ 时，由中心极限定理，
  $
    (X - n p) / sqrt(n p (1-p)) ->^d N(0, 1).
  $
]

= 第二题

#solution[
  #parts[
    设 $(X, Y)$ 的联合密度为
    $
      f(x, y) = cases(
        c x y quad & 0 < x < 1\, 0 < y < 1,
        0 & "其他".
      )
    $
    由归一化条件 $integral_0^1 integral_0^1 c x y dif x dif y = c / 4 = 1$，故 $c = 4$。
  ][
    $X$ 的边缘密度为
    $
      f_X (x) = integral_0^1 4 x y dif y = 2x, quad 0 < x < 1.
    $
  ][
    条件密度为
    $
      f_(Y|X)(y|x) = (f(x,y)) / (f_X (x)) = (4 x y) / (2 x) = 2y, quad 0 < y < 1.
    $
    故 $Y | X = x$ 的分布与 $x$ 无关，即 $X$ 与 $Y$ 独立。
  ]
]

= 第三题

#proof[
  设 $X_1, X_2, ...$ 为独立同分布的随机变量，$E[X_i] = mu$，$"Var"(X_i) = sigma^2 < oo$。

  记 $overline(X)_n = 1/n sum_(i=1)^n X_i$。由大数定律，$overline(X)_n ->^P mu$。

  进一步，由强大数定律，$overline(X)_n -> mu$ 几乎处处成立。
]

= 第四题

#definition(title: "特征函数")[
  随机变量 $X$ 的特征函数定义为
  $
    phi_X (t) = E[e^(i t X)] = integral_(-oo)^(+oo) e^(i t x) f(x) dif x.
  $
]

#theorem(title: "逆转公式")[
  若 $integral_(-oo)^(+oo) |phi_X (t)| dif t < oo$，则 $X$ 有连续密度
  $
    f(x) = 1/(2 pi) integral_(-oo)^(+oo) e^(-i t x) phi_X (t) dif t.
  $
]

#proof[
  由 Fourier 逆变换直接得到。
]
