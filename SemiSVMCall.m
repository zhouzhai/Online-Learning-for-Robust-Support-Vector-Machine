function out=SemiSVMCall(original_x,original_y,x,y)
    global  C C_star
    label_size=sum(original_y~=0);
    os=SMO.InitialSolution(original_x,original_y,C);
    [PreLowBound,PreUppBound]=SMO.ComputerCCstar(x,y,label_size,os);
    terminal_flag=0;
    NowLowBound=PreLowBound;
    NowUppBound=PreUppBound;
    while terminal_flag==0
        objcs=SemiSVM(x,y,NowLowBound,NowUppBound,0);
        PreLowBound=NowLowBound;
        PreUppBound=NowUppBound;
        [NowLowBound,NowUppBound]=SemiSVM.ComputerCCstar(x,y,label_size,objcs);
        terminal_flag=SemiSVM.CheckTerminial(PreLowBound,PreUppBound,NowLowBound,NowUppBound);
    end
    out=objcs;
    out.local_minimal=SemiSVM.TestMinimal(out,label_size);
end