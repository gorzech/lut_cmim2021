% Linear damped mass-spring-damper example solved using Euler Cromer
% With zero external force
% Add Lecture08 to path to make it work
function linear_damping()
    c_s = 0.3;
    k_s = 1;
    
    s_f = @(u) k_s*u;
    F = @(t) 0;
    m = 1;
    c_f = @(v) c_s * v;
    
    U_0 = 1;
    V_0 = 0;
    T = 12*pi;
    dt = T/200;
    [t, u, v] = EulerCromer(c_f, s_f, F, m, T, U_0, V_0, dt);
%     plot(t, u, t, v);
    plot(t, u);
end