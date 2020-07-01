function res = mgi_robot(passage)
    % Experimental : MGI du robot.

    [L1, L2, L3, L4, L5] = get_robot_lengths; 
    
    t = passage;
    x = t(2, 4);
    y = - t(1, 4);
    z = - L5;
    
    if x == 0 && y ~= 0
        s1 = z / y;
        q1 = atan2(s1, sqrt(1 - s1^2));
    elseif x ~= 0 && y == 0
        c1 = z / x;
        q1 = atan2(sqrt(1 - c1^2), c1);
    elseif x ~= 0 && y ~= 0 && z == 0
        q1 = atan2(-x, y);
    elseif x ~= 0 && y ~= 0 && z ~= 0
        e = 1;
        xy_sq = x^2 + y^2;
        if xy_sq >= z^2
            tmp = sqrt(xy_sq - z^2);
            s1 = (y * z + e * x * tmp) / xy_sq;
            c1 = (x * z - e * y * tmp) / xy_sq;
            q1 = atan2(s1, c1);
        else
            q1 = 0;
            disp("Pas de solution !");
        end
    end
    
    c1 = cos(q1);
    s1 = sin(q1);
    A = -s1 * t(1,1) + c1 * t(2,1);
    B = -s1 * t(1,2) + c1 * t(2,2);
    C = -s1 * t(1,3) + c1 * t(2,3);
    AB = A^2 + B^2;
    q5 = acos(-sqrt((AB - C^2) / (AB + C^2)));
    
    res = [q1 0 0 0 q5 0];
end