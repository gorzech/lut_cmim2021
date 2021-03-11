%% generate data
f = @(x) sqrt(x);
a = 0;
b = 2;

n = 10;
eps_list = logspace(-1, -10, n);

n_trap = zeros(n, 1);
n_midp = zeros(n, 1);

paths_to_add = '../../Lecture06';
addpath(paths_to_add);
for ii = 1 : n
    [~, n_trap(ii)] = adaptive_integration(f, a, b, eps_list(ii), ...
        @trapezoidal_vec);
    [~, n_midp(ii)] = adaptive_integration(f, a, b, eps_list(ii), ...
        @midpoint_vec);
end
rmpath(paths_to_add);

%% Semilog plot?!

% plot(log(eps_list), n_trap, '-o', log(eps_list), n_midp, '--x')
plot(log10(eps_list), n_trap, '-o', log10(eps_list), n_midp, '--x')
grid on
legend('Trapezoidal', 'Midpoint')
xlabel('log_{10}\epsilon')
% xlabel('log\epsilon')
ylabel('No. integration points')

%% Semilog plots

semilogx(eps_list, n_trap, '-o', eps_list, n_midp, '--x')
grid on
legend('Trapezoidal', 'Midpoint')
xlabel('\epsilon')
ylabel('No. integration points')

%% Logarithmic plots

loglog(eps_list, n_trap, '-o', eps_list, n_midp, '--x')
grid on
legend('Trapezoidal', 'Midpoint')
xlabel('\epsilon')
ylabel('No. integration points')