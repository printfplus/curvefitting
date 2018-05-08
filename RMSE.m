function f = RMSE(y,z)
    size_new = max(size(y,1),size(y,2));
    f = sqrt(sum((y-z).^2)/size_new);