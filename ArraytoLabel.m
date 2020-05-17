j = 1;
for k=1:9
    for i=1:10000
        if(StorageArray{i,2} == k)
            RecordLabel{j,1} = StorageArray{i,1};
            RecordLabel{j,2} = StorageArray{i,2};
            j = j + 1;
        end
    end
end