% Conversion of bryant angles.

% lambda :  l in ]-pi, pi]
% mu :      m in [-pi/2, pi/2]
% nu :      n in ]-pi, pi]

function res = mat_bryant(l, m, n)
    res = mat_rotation('x', l) * mat_rotation('y', m) * mat_rotation('z', n);
end
