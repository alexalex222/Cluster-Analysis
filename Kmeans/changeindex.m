for i=1:2000
    if kmeanclasslabel(i)==2;
        kmeanclasslabel(i)=1;
    else kmeanclasslabel(i)=2;
    end
end