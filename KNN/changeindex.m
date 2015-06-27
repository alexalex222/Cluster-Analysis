for i=1:2000
    if knnclasslabel(i)==2;
        knnclasslabel(i)=1;
    else knnclasslabel(i)=2;
    end
end