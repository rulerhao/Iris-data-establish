Count = 1;
for i = 1:10000
    if RecordLabel{i,2} == Count
        LabelStartIdx{Count} = i;
        Count = Count + 1;
    end
end