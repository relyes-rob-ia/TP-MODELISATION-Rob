function passage = mgd_robot(params_dh)
    % Retourne la matrice de passage issue de tous les parametres de DH.

    passage = eye(4, 4);
    nb_colonnes = size(params_dh, 2);
    
    for i = 1:nb_colonnes
        col_dh = params_dh(:, i);
        passage = passage * mat_liaison(col_dh);
    end
end
