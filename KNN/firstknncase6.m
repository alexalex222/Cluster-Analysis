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

% mode1n=[mode1_normal.x,mode1_normal.y];
% mode3n=[mode3_normal.x,mode3_normal.y];
% mode1f=[mode1_idv14.x,mode1_idv14.y];
% mode3f=[mode3_idv8.x,mode3_idv8.y];
distancex = mode1_normal.x-mode3_normal.x;
distancey = mode1_normal.y-mode3_normal.y;
mode1n=[mode1_normal.x,mode1_normal.y];
mode1n=mode1n(1:6:900,:);
mode3n=[mode3_normal.x+0.87*distancex,mode3_normal.y+0.87*distancey];
mode3n=mode3n(1:6:900,:);
mode1f=[mode1_idv2.x,mode1_idv2.y];
mode1f=mode1f(1:6:900,:);
mode3f=[mode3_idv8.x+0.86*distancex,mode3_idv8.y+0.86*distancey];
mode3f=mode3f(1:6:900,:);
% mode1f=[mode1_idv2.x,mode1_idv2.y;mode1_idv12.x,mode1_idv12.y;mode1_idv13.x,mode1_idv13.y;mode1_idv14.x,mode1_idv14.y;];
% mode1f=mode1f([1:4:4000],:);
% mode3f=[mode3_idv1.x,mode3_idv1.y;mode3_idv10.x,mode3_idv10.y;mode3_idv13.x,mode3_idv13.y;mode3_idv14.x,mode3_idv14.y;];
% mode3f=mode3f([1:4:4000],:);
Tdata=[mode1n;mode1f;mode3n;mode3f];


[nr,nc]=size(mode1n);
[nr1,nc1]=size(Tdata);
[~,mu,sigma]=zscore(mode1n);
mu=repmat(mu,nr1,1);
sigma=repmat(sigma,nr1,1);
dataP1=(Tdata-mu)./sigma;

[T1,P1] = pca(dataP1,10);

% T1=zscore(Tdata);
firstknnclasslabel=clusterdata(T1,'maxclust',2,'criterion','inconsistent','linkage','ward');

modeidrate=600;
for i=1:300
    if firstknnclasslabel(i)~=2
        modeidrate=modeidrate-1;
    end
end
for i=301:600
    if firstknnclasslabel(i)~=1
        modeidrate=modeidrate-1;
    end
end
modeidrate=modeidrate/600;