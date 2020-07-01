function params_dh = get_params_dh(config)
    % Retourne le tableau des parametres de Denavit-Hartenberg pour une
    % configuration donnee.
    % config : angles en degres
    
    % Longueurs des liaisons
    [~, L2, L3, L4, L5] = get_robot_lengths;

    % Decalage des origines des rotations pour correspondre au MGD du robot
    decalage = [0, -pi/2, pi/2, 0, 0, 0];
    
    q = deg2rad(config) + decalage;
    q = [q 0];
    params_dh = [
        0, -pi/2, 0, pi/2, -pi/2, pi/2, 0;
        0, 0, L2, 0, 0, 0, 0;
        q;
        0, L5, 0, L3, 0, 0, L4
    ];
end
