clear;
clc;
close all;

load TEPdata\mode1_normal;
load TEPdata\mode1_idv1;
load TEPdata\mode1_idv2;
load TEPdata\mode1_idv3;
load TEPdata\mode1_idv4;
load TEPdata\mode1_idv5;
load TEPdata\mode1_idv6;
load TEPdata\mode1_idv7;
load TEPdata\mode1_idv8;
load TEPdata\mode1_idv9;
load TEPdata\mode1_idv10;
load TEPdata\mode1_idv11;
load TEPdata\mode1_idv12;
load TEPdata\mode1_idv13;
load TEPdata\mode1_idv14;
load TEPdata\mode1_idv15;

load TEPdata\mode3_normal;
load TEPdata\mode3_idv1;
load TEPdata\mode3_idv2;
load TEPdata\mode3_idv3;
load TEPdata\mode3_idv4;
load TEPdata\mode3_idv5;
load TEPdata\mode3_idv6;
load TEPdata\mode3_idv7;
load TEPdata\mode3_idv8;
load TEPdata\mode3_idv9;
load TEPdata\mode3_idv10;
load TEPdata\mode3_idv11;
load TEPdata\mode3_idv12;
load TEPdata\mode3_idv13;
load TEPdata\mode3_idv14;
load TEPdata\mode3_idv15;

distancex = mode1_normal.x-mode3_normal.x;
distancey = mode1_normal.y-mode3_normal.y;

mode1n=[mode1_normal.x,mode1_normal.y];
mode3n=[mode3_normal.x+0.9*distancex,mode3_normal.y+0.9*distancey];
mode1f=[mode1_idv2.x,mode1_idv2.y];
mode3f=[mode3_idv8.x+0.9*distancex,mode3_idv8.y+0.9*distancey];
Tdata=[mode1n;mode1f;mode3n;mode3f];

[nr,nc]=size(mode1n);
[nr1,nc1]=size(Tdata);
[~,mu,sigma]=zscore(mode1n);
mu=repmat(mu,nr1,1);
sigma=repmat(sigma,nr1,1);
dataP1=(Tdata-mu)./sigma;

[T1,P1] = pca(dataP1,10);
T1=T1';
scatter3(T1(1,1:1000),T1(2,1:1000),T1(3,1:1000),'og');
hold on;
scatter3(T1(1,1001:2000),T1(2,1001:2000),T1(3,1001:2000),'xr');
scatter3(T1(1,2001:3000),T1(2,2001:3000),T1(3,2001:3000),'^b');
scatter3(T1(1,3001:4000),T1(2,3001:4000),T1(3,3001:4000),'*m');
legend('Base Mode Normal','Base Mode Faulty','New Mode Normal','New Mode Faulty');
% axis([-100 1200 -200 300 -400 0]);
hold off;
