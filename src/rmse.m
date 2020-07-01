
function res = rmse(val1, val2)
    % Root Mean Square Error
    res = sqrt(mse(val1, val2));
end

function res = mse(val1, val2)
    % Mean Square Error
    diff = val1(:) - val2(:);
    res = sum(diff .^ 2) / size(val1(:), 1);
end

