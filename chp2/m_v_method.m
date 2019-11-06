close all
clear all
%
%全局初始化-----------------------------------------------------------------

R_total=0;
avgr1=zeros(1,1000);
avgr2=zeros(1,1000);
avgr_total1=zeros(1,1000);
avgr_total2=zeros(1,1000);

%--------------------------------------------------------------------------

for round_total=1:2000
    

%分次初始化-----------------------------------------------------------------
    
    q=randn(1,10);
    %p=normrnd(avg,sigema); 生成均值为avg标准差为sigema的正态分布随机数 
    %result = unidrnd(N); 生成随机整数
    Q=zeros(1,10); % 每个动作价值估计
    Q1=zeros(1,10);
    A=zeros(1,10);
    act_time=zeros(1,10);% 储存每个动作进行了多少次
    act_time1=zeros(1,10);
    R=zeros(1,10); % 储存每个动作的收益总和
    R1=zeros(1,10);
    %10个动作
    for i=1:10
       A(i)=i; 
    end

%贪婪方法-------------------------------------------------------------------

    avgr1=greedy(Q,q,act_time,R,avgr1);
    avgr_total1=avgr1/round_total;
    
%ε=0.1--------------------------------------------------------------------
    
    avgr2=epsilo01(Q1,q,act_time1,R1,avgr2);
    avgr_total2=avgr2/round_total;
    
%--------------------------------------------------------------------------
end
plot(avgr_total1,'b');
hold on;
plot(avgr_total2,'r');

