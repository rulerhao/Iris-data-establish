for i = 1:1000
    for J = 1:10
        for k = 1:10
            Number{k} = 0;
        end
    end
    for j = 1:10
        Number{StorageArray{(i - 1) * 10 + j,2}} = Number{StorageArray{(i - 1) * 10 + j,2}} + 1;
    end
    [MaxNum,MaxIdx] = max([Number{1,:}]);
    for j = 1:10
        StorageArray{(i - 1) * 10 + j,2} = MaxIdx;
    end
end