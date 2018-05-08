table1 = xlsread('table1.xlsx');
table2 = xlsread('table2.xlsx');
n = 1;
number = 15;
[x,y,x_validate,y_validate] = get_train(table1,number);

RMSE_matrix = [];
for n = 1:10
    p = polyfit(x,y,n);
    z = polyval(p,x);
    train_set = [x;y;z];
    z_validate = polyval(p,x_validate);
    validate_set = [x_validate;y_validate;z_validate];

    RMSE_train = RMSE(y,z);
    RMSE_validate = RMSE(y_validate,z_validate);
    x_test = table2(:,2);
    y_test = table2(:,1);
    z_test = polyval(p,x_test);
    RMSE_test = RMSE(y_test,z_test);
    RMSE_onepoch = [RMSE_train,RMSE_validate,RMSE_test];
    RMSE_matrix = [RMSE_matrix;RMSE_onepoch];
end