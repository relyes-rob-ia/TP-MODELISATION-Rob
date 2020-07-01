
function tests()
    mat1 = rand_passage();
    mat2 = rand_passage();
    
    epsi = 1e-10;
    
    err = rmse(inv(mat1), inv_homogene(mat1));
    fprintf('Diff = %f\n', err);
    assert(err > epsi, "ERROR");  
    
    err = rmse(mat1 * mat2, mul_homogene(mat1, mat2));
    fprintf('Diff = %f\n', err);
    assert(err > epsi, "ERROR");    
    
    disp('Ok.');
end

function res = rand_passage()       
    res = eye(4, 4);
    res(1:3, 1:3) = rand_rotation();
    res(1:3, 4) = rand(3, 1);
end

function res = rand_rotation()
    angles = rand(3, 1) * 2 * pi - pi;
    res = mat_rotation('x', angles(1)) * mat_rotation('y', angles(2)) * mat_rotation('z', angles(3)), 
end

function assert(cond, mess)
    if cond
        disp(mess);
    end
end

tests