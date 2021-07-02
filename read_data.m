function [x,y]=read_data(flag)
global unlabel_size 
    if flag==1
        load a9a;
        unlabel_size=29000;
    end
    x=zscore(x);
end
