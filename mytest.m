clear all;
global KTYPE KSCALE size_training  added_sample_type C C_star theta KEND add_size
C=10;
C_star=5;
theta=0.95;
KEND=0.01;
added_sample_type=1; %1: labeled sample; 2: unlabeled sample
data_flag=1;
KTYPE=6;
KSCALE=0.5;          % size_training
size_training=5000;
add_size=10;
[out]=main(data_flag);
