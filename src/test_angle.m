function [score_global,score,matrix,type_Euler] = test_angle(angles,matT07)
    %TEST_ANGLE Summary of this function goes here
    %   Detailed explanation goes here
    list = ['xzx'; 'xzy'; 'xyx'; 'xyz'; 'yxy'; 'yxz'; 'yzy'; 'yzx'; 'zyz'; 'zyx'; 'zxz'; 'zxy'];
    score = 10;
    id = eye(3,3);
    score_global = zeros(1,size(list,1));
    for i=1:size(list,1) 
        cas = list(i,:);
        mat_rot_Sit = mat_euler_test(angles(1),angles(2),angles(3),cas);
        mat_Test = matT07 * mat_rot_Sit';
        score_act = sum(abs(mat_Test - id),'all');
        score_global(i)= score_act;
        if score > score_act
           matrix =  mat_Test;
           score = score_act;
           type_Euler = cas;
        end
    end
end

