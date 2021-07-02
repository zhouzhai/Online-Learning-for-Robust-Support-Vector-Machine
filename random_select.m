function [original_x,original_y,extended_x,extended_y,added_x,added_y]=random_select(x,y)
    global  size_training added_sample_type add_size
    unlabeled_index=find(y==0);
    labeled_index=[1:length(y)];
    labeled_index(unlabeled_index)=[];
    index_added=[];
    if added_sample_type==1
        index1=randi([1,length(labeled_index)],add_size,1);
        index_added=labeled_index(index1);
        labeled_index(index1)=[];        
    end
    if added_sample_type==2
        index1=randi([1,length(unlabeled_index)],add_size,1);
        index_added=unlabeled_index(index1);
        unlabeled_index(index1)=[];
    end
    res = [];
    local_size=size_training-length(labeled_index);
    while length(res) ~= local_size
        tmp_res = unique(randi([1,length(unlabeled_index)],local_size,1));
        tmp_res = sort(tmp_res);
        res = [res;tmp_res];
        res = unique(res);
        if length(res) >= local_size
            res = res(1:local_size);
            res = sort(res);
        end
    end
    local_unlabeled_index=unlabeled_index(res);
    final_index=[labeled_index';local_unlabeled_index];
    original_x=x(final_index,:);
    original_y=y(final_index);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    nonLabel_index=1:length(original_y);
    Label_index=find(~original_y==0);
    nonLabel_index(Label_index)=[];
    extended_x=[original_x(Label_index,:);original_x(nonLabel_index,:);original_x(nonLabel_index,:)];
    extended_y=[original_y(Label_index);-ones(length(nonLabel_index),1);ones(length(nonLabel_index),1)];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    added_x=x(index_added,:);
    added_y=y(index_added);
end