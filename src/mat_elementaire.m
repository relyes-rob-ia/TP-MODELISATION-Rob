function res = mat_elementaire(type, axe, valeur)
    % Retourne la matrice de passage homogène 
    
    % type : ['r', 't'] : rotation ou translation
    % axe in ['x', 'y', 'z'] : axe de rotation ou translation
    % valeur in float : valeur de translation ou rotation
    
    switch type
        case 't'
            res = [
                1, 0, 0, double(axe == 'x') * valeur;
                0, 1, 0, double(axe == 'y') * valeur;
                0, 0, 1, double(axe == 'z') * valeur;
                0, 0, 0, 1
            ];
        case 'r'
            res = eye(4, 4);
            res(1:3, 1:3) = mat_rotation(axe, valeur);
    end
end
