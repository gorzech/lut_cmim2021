function [result, n] = adaptive_integration(f, a, b, eps, method)
%ADAPTIVE_INTEGRATION Simple adapive integration scheme

n = 1;
old_result = method(f, a, b, n);

while true
    n = 2 * n;
    result = method(f, a, b, n);
    if abs(result - old_result) < eps
        break;
    end
    old_result = result;
end
end

