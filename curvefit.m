table1 = xlsread('table1.xlsx');
table2 = xlsread('table2.xlsx');
n = 1;
number = 15;
[x,y,x_test,y_test] = get_train(table1,number);
p = polyfit(x,y,n);
z = polyval(p,x);
train_set = [x;y;z];
z_test = polyval(p,x_test);
test_set = [x_test;y_test;z_test];

RMSE_train = RMSE(y,z);
RMSE_test = RMSE(y_test,z_test);
RMSE_validate = RMSE(polyval(p,table2(:,1)),table2(:,2));