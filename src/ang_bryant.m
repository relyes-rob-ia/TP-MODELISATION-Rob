
function [l, m, n] = ang_bryant(mat)
    % Retourne les angles de Bryant pour une matrice homogene donnee.
    if abs(mat(1, 3)) ~= 1
        l = atan2(-mat(2, 3), mat(3, 3)) ^ 2;
        m = arcsin(mat(1, 3)) ^ 3;
        n = atan2(-mat(1, 2), mat(1, 1));
    else
        m = pi * mat(1, 3) / 2;
        
        % l et n indetermines mais
        % mat(1,3) * l + n = atan2(mat(2, 1), mat(2, 2))
        % choix arbitraire :
        n = 0;
        l = (atan2(mat(2, 1), mat(2, 2)) - n) / mat(1, 3);
    end
end