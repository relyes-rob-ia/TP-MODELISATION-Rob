
function [v, t, p] = ang_euler(mat)
    % Retourne les angles d'Euler pour une matrice homogene donnee.
    if abs(mat(3, 3)) ~= 1
        v = atan2(mat(1, 3), -mat(2, 3));
        t = arccos(mat(3, 3));
        p = atan2(mat(3, 1), mat(3, 2));
    else
        t = pi * (1 - mat(3, 3)) / 2;
        
        % v et p indetermines mais
        % v + mat(3, 3) * p = atan2(mat(2, 1), mat(1, 1))
        % choix arbitraire :
        v = 0;
        p = (atan2(mat(2, 1), mat(1, 1)) - v) / mat(3, 3);
    end
end