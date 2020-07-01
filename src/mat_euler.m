% Conversion of eulers angles.

% vu :      v in ]-pi, pi]
% theta :   t in [0, pi]
% phi :     p in ]-pi, pi]

function res = mat_euler(v, t, p)
    res = mat_rotation('z', v) * mat_rotation('x', t) * mat_rotation('z', p);
end
