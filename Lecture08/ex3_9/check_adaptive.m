%% Function one

paths_to_add = '../../Lecture06';
addpath(paths_to_add);
f = @(x) x .^ 2;
a = 0;
b = 2;
exact = 8 / 3;

eps1 = 1e-1;
[result, n] = adaptive_integration(f, a, b, eps1, @trapezoidal_vec);
assert(abs(result - exact) < eps1);

eps2 = 1e-10;
[result, n] = adaptive_integration(f, a, b, eps2, @trapezoidal_vec);
assert(abs(result - exact) < eps2);

rmpath(paths_to_add);

%% Function two

paths_to_add = '../../Lecture06';
addpath(paths_to_add);
f = @(x) sqrt(x);
a = 0;
b = 2;
exact = 2 / 3 * 2 ^ 1.5;

eps1 = 1e-1;
[result, n] = adaptive_integration(f, a, b, eps1, @trapezoidal_vec);
assert(abs(result - exact) < eps1);

eps2 = 1e-10;
[result, n] = adaptive_integration(f, a, b, eps2, @trapezoidal_vec);
assert(abs(result - exact) < eps2);

rmpath(paths_to_add);