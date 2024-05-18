clear;
clc;
load("out.mat");
G2=S11.^2;
C=all(G2<0.05,2);
[idx,val]=find(C==1);
[X, Y] = meshgrid(1:121,1:121);
Z_G2 = zeros(121*121,1);
Z_G2(idx)=1;
ZZ=reshape(Z_G2,[121,121]);
surface(X, Y, ZZ);

idx_area1 = idx(idx<5000);
idx_area2 = idx(idx>5000);

P_TL1_area1=P_TL1(idx_area1,:);
P_TL1_area2=P_TL1(idx_area2,:);

P_TL2_area1=P_TL2(idx_area1,:);
P_TL2_area2=P_TL2(idx_area2,:);

P_L_area1=P_L(idx_area1,:);
P_L_area2=P_L(idx_area2,:);

P_REF_area1=G2(idx_area1,:);
P_REF_area2=G2(idx_area2,:);

%%%% area1

P_TL1_area1_min = min(P_TL1_area1,[],"all");
P_TL1_area1_max = max(P_TL1_area1,[],"all");

P_TL2_area1_min = min(P_TL2_area1,[],"all");
P_TL2_area1_max = max(P_TL2_area1,[],"all");

P_L_area1_min = min(P_L_area1,[],"all");
P_L_area1_max = max(P_L_area1,[],"all");

P_REF_area1_min = min(P_REF_area1,[],"all");
P_REF_area1_max = max(P_REF_area1,[],"all");

P_area1_check = P_TL1_area1_max + P_TL2_area1_max + P_REF_area1_max + P_L_area1_max;

%%%% area2

P_TL1_area2_min = min(P_TL1_area2,[],"all");
P_TL1_area2_max = max(P_TL1_area2,[],"all");

P_TL2_area2_min = min(P_TL2_area2,[],"all");
P_TL2_area2_max = max(P_TL2_area2,[],"all");

P_L_area2_min = min(P_L_area2,[],"all");
P_L_area2_max = max(P_L_area2,[],"all");

P_REF_area2_min = min(P_REF_area2,[],"all");
P_REF_area2_max = max(P_REF_area2,[],"all");

P_area2_check = P_TL1_area2_max + P_TL2_area2_max + P_REF_area2_max + P_L_area2_max;

%%%% output

fprintf('A1 TL1: %f %f\n', P_TL1_area1_min, P_TL1_area1_max);
fprintf('A1 TL2: %f %f\n', P_TL2_area1_min, P_TL2_area1_max);
fprintf('A1 L: %f %f\n', P_L_area1_min, P_L_area1_max);
fprintf('A1 REF: %f %f\n', P_REF_area1_min, P_REF_area1_max);
fprintf('A1 CHECK: %f\n', P_area1_check);

fprintf('A2 TL1: %f %f\n', P_TL1_area2_min, P_TL1_area2_max);
fprintf('A2 TL2: %f %f\n', P_TL2_area2_min, P_TL2_area2_max);
fprintf('A2 L: %f %f\n', P_L_area2_min, P_L_area2_max);
fprintf('A2 REF: %f %f\n', P_REF_area2_min, P_REF_area2_max);
fprintf('A2 CHECK: %f\n', P_area2_check);
