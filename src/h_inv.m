function [res] = h_inv(mat)  
    % Retourne l'inverse d'une matrice de passage homogene.
    rot = h_rot(mat);
    pos = h_pos(mat);
    
    res = eye(4, 4);
    res(1:3, 1:3) = rot';
    res(1:3, 4) = -rot' * pos;
end
