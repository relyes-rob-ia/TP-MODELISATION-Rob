function [res] = h_mul(mat1, mat2)    
    % Retourne la multiplication matricielle entre deux matrices de passage
    % homogene.
    res = eye(4, 4);
    res(1:3, 1:3) = h_rot(mat1) * h_rot(mat2);
    res(1:3, 4) = h_pos(mat1) + h_rot(mat1) * h_pos(mat2);
end
