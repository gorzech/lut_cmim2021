
q0 = system_coordinates(bodies);
q0p = zeros(size(q0));

y0 = [q0; q0p];

tspan = [0, 5]; % Provide solution from 0 to 5 s using interlat stepping. 

tspan = 0 : 0.1 : 5;

[T, Y] = ode45(@odefun, tspan, y0);

function dydt = odefun(t, y)
% as y = [q; qp]
% We must return dydt = [qp; qpp]
nq = length(y) / 2;

q = y(1 : nq);
qp = y(nq + 1 : end);

M = mass_matrix(bodies);
Cq = constraint_dq(revolute, simple, [], t, q);

C = constraint(revolute, simple, [], t, q);

A = [M, Cq'
    Cq, zeros(length(C))];


Cdot = Cq * qp;

f = force_vector(grav, sforce, bodies, q);

g = g_vec(revolute, simple, t, q, qp); % To do

g_mod = g - 2 * alpha * Cdot - beta ^ 2 * C;

rhs = [f
    g_mod];

x = A\rhs;

qpp = x(1 : nq);

dydt = [qp; qpp];

end

