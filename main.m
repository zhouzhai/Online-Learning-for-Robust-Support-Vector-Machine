function [out]=main(data_flag)
    [x,y]=read_data(data_flag);
    [y]=ModifyData4Semi(y);
    [original_x,original_y,extended_x,extended_y,added_x,added_y]=random_select(x,y);
    initial_solution=initial(original_x,original_y,extended_x,extended_y);
    out=IncSemiSVM.Run(original_y,extended_x,extended_y,added_x,added_y,initial_solution);
end
