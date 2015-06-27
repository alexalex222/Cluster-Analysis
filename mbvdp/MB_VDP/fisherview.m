[Trans,Z]=LFDA(T1',classlabel,3);
scatterMixture2(Z([1 2],:)',classlabel);
xlabel('1st Fisher');
ylabel('2nd Fisher');
% legend('Base Mode','New Mode','Outlier','Outlier');
legend('Normal','Faulty');