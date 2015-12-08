# Test for gausslegendre().

tol = 1e-14
n = 42
x, w = gausslegendre(n)
@test length(x) == n && length(w) == n
@test abs(x[37] - 0.910959724904127) < tol
@test abs(w[37] - 0.030479240699603) < tol

@test_approx_eq dot( w,(x.^2)) 2/3

# Test a larger n (using ASY)
n = 251
x, w = gausslegendre(n)
@test all(length(x) == n) && all(length(w) == n)
@test abs(x[37] + 0.896467746955729) < tol
@test abs(w[37] - 0.005535005742012) < tol

@test_approx_eq dot( w,(x.^2)) 2/3

x, w = gausslegendre(1013)
@test norm(x[2] - -0.999985167586110, Inf) < tol
@test norm(x[13] - -0.999218995240887, Inf) < tol
@test norm(w[2] - 1.681691163200592e-05, Inf) < tol
@test norm(w[13] - 1.224755309137936e-04, Inf) < tol

@test_approx_eq dot( w,(x.^2)) 2/3

x, w = gausslegendre(10013)
@test norm(x[2] - -0.999999848054223, Inf) < tol
@test norm(x[13] - -0.999991998242661, Inf) < tol
@test norm(w[2] - 1.722757320118474e-07, Inf) < tol
@test norm(w[13] - 1.254980540032470e-06, Inf) < tol

@test_approx_eq dot( w,(x.^2)) 2/3
