function [x,y,x_test,y_test] = get_train(matrix,number)
    whole_number = size(matrix,1);
    test_number = whole_number-number;
    newrand = randperm(whole_number);
    logo = newrand(1:number);
    newrand(1:number) = [];
    x = [];
    y = [];
    x_test = [];
    y_test = [];
    for i = 1:number 
        x = [x,matrix(logo(i),2)];
        y = [y,matrix(logo(i),1)];
    end
    for i = 1:test_number
        x_test = [x_test,matrix(newrand(i),2)];
        y_test = [y_test,matrix(newrand(i),1)];
    end
end
