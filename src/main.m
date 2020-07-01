% M2-ROB-TP2
% M2 Bloc 3 : TP2 de Robotique Insdustrielle Avancée
% MGD d'un robot
% Cree le 05/02/2020

% [q1 q2 q3 q4 q5 q6]
% units: degrees

clc;

configs = {
    [0, 0, 0, 0, 0, 0]
    [0, 0, 0, 0, 0, 90]
    [0, 0, 0, 90, 0, 0]
    [0, -45, 0, 0, 0, 0]
    [0, -45, 0, 0, 0, 90]
    [0, -45, 0, 90, 0, 0]
    [0, -45, -45, 0, 45, 0]
    [-0.67, -69.6, 14.77, 0, 54.83, 0.67]
    [58.48, -68.3, -10.05, -0.02, 67.2, 2.31]
    [57.6, -67.2, -26.06, -186.27, -66.15, 48.39]
};
% [Tx Ty Tz A1 A2 A3] 
% units: mm, degrees
situations = {
    [0, 49, 665, 0, 0, 0]
    [0, 49, 665, 0, 0, 90]
    [0, 49, 665, 0, 0, 90]
    [-470.24, 48.98, 470.21, 0, -45, 0]
    [-470.24, 48.98, 470.21, 0, -45, 90]
    [-470.24, 48.98, 470.21, 0, -45, 90]
    [-561.04, 48.97, 250.98, 0, -45.01, 0]
    [-524.59, 55.12, 344.68, 0, 0, 0]
    [-347.94, -473.58, 233.66, 9.54, -5.79, 61.27]
    [-358.65, -490.85, 152.29, 26.38, -9.07, -72.78]
};

nb_configs = size(configs, 1);

pos_estimes = zeros(nb_configs, 3);
pos_reels = zeros(nb_configs, 3);
list = ['xzx'; 'xzy'; 'xyx'; 'xyz'; 'yxy'; 'yxz'; 'yzy'; 'yzx'; 'zyz'; 'zyx'; 'zxz'; 'zxy'];
score_global = zeros(1,size(list,1));
for i = 1:nb_configs
    config = configs{i};
    situation = situations{i};
    
    params_dh = get_params_dh(config);
    T07 = mgd_robot(params_dh);
    
    mat_rot_T07 = h_rot(T07);
    
    rot_Sit = situation(4:6);
    rS = rot_Sit;
    
    [score_global_local,score,matrix,type_Euler] = test_angle(rS,mat_rot_T07);
    score_global = score_global + score_global_local;
    pos_estimes(i,:) = T07(1:3, 4);
    pos_reels(i,:) = situation(1:3);
end
score_global
[mini,index] = min(score_global)
fprintf("Model used = %s avec un score de %d\n", list(index,:), mini);
error = rmse(pos_estimes, pos_reels);
fprintf("RMSE = %f\n", error);
