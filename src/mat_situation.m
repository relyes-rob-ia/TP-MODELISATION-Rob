function passage = mat_situation(situation)
    % Retourne la matrice correspondant a une situation
    % (x,y,z,ang1,ang2,ang3).
    % Les angles sont en degres.
    ang = situation(4:6);
    rot = mat_bryant(ang(1), ang(2), ang(3));
    
    passage = eye(4);
    passage(1:3, 4) = situation(1:3);
    passage(1:3, 1:3) = rot;
end
