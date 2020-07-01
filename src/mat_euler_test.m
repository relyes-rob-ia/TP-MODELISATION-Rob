% Conversion of eulers angles.

% vu :      v in ]-pi, pi]
% theta :   t in [0, pi]
% phi :     p in ]-pi, pi]

function res = mat_euler_test(v, t, p, cas)
    res = mat_rotation(cas(1), v) * mat_rotation(cas(2), t) * mat_rotation(cas(3), p);
end
