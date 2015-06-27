% classlabel=zeros(2000,1);
% classlabel(1:1000)=ones(1000,1);
% classlabel(1001:2000)=ones(1000,1)*2;
% Z=T1';
[Trans,Z]=LFDA(T1',classlabel,3);

scatter3(Z(1,1:1000),Z(2,1:1000),Z(3,1:1000),'og');
hold on;
scatter3(Z(1,1001:2000),Z(2,1001:2000),Z(3,1001:2000),'xr');
xlabel('1st Fisher');
ylabel('2nd Fisher');
zlabel('3rd Fisher');
legend('Base Mode Normal','Base Mode Faulty');
% axis([-100 1200 -200 300 -400 0]);