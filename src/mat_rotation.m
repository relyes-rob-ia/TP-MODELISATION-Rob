function [res] = mat_rotation(axe, valeur)
    % Retourne la matrice de rotation.
    % axe in ['x', 'y', 'z'] : axe de rotation
    % valeur in float : valeur de rotation

    switch axe
        case 'x'
            res = [
                1, 0, 0;
                0, cos(valeur), -sin(valeur);
                0, sin(valeur), cos(valeur)
            ];
        case 'y'
            res = [
                cos(valeur), 0, sin(valeur);
                0, 1, 0;
                -sin(valeur), 0, cos(valeur)
            ];
        case 'z'
            res = [
                cos(valeur), -sin(valeur), 0;
                sin(valeur), cos(valeur), 0;
                0, 0, 1;
            ];
    end
end