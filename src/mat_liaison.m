
function res = mat_liaison(col_dh)
    % Retourne la matrice de passage correspondant a une colonne des parametres de DH.

    alpha = col_dh(1);
    dist = col_dh(2);
    theta = col_dh(3);
    rot = col_dh(4);
    
    res = mat_elementaire('r', 'x', alpha) * mat_elementaire('t', 'x', dist) * mat_elementaire('r', 'z', theta) * mat_elementaire('t', 'z', rot);
end
