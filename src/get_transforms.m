
function transforms = get_transforms(config)
    % Returns a list of transforms T_{i-1, i} matrixs
    params_dh = get_params_dh(config);
    nb_colonnes = size(params_dh, 2);
    
    transforms = cell(4, 4);
    for i = 1:nb_colonnes
        col_dh = params_dh(:, i);
        transforms{i} = mat_liaison(col_dh);
    end
    