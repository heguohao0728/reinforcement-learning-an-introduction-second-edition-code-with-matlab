function [avgr2]=epsilo01(Q1,q,act_time1,R1,avgr2)
     for roundnum=1:1000
        otherindex=[1,2,3,4,5,6,7,8,9,10];
        select=0;
        p_greedy=1-0.1+0.1/10;
        px=rand;
        if px<=p_greedy
            select=1;
        end
        Q_sort=sort(Q1,'descend');
        m=Q_sort(1);
        k=1;
        p=1;
        for j=1:10
            if Q1(j)==m
               maxindex(k)=j;
               k=k+1;
            else
               otherindex(p)=j;
               p=p+1;
            end
        end
        if select==1
            if length(maxindex)~=1
                action_index=maxindex(ceil(rand()*length(maxindex)));
            else
                action_index=maxindex(1);
            end
            act_time1(action_index)=act_time1(action_index)+1;
            r=normrnd(q(action_index),1);
            R1(action_index)=R1(action_index)+r;
            Q1(action_index)=R1(action_index)/act_time1(action_index);
            avgr2(roundnum)=avgr2(roundnum)+sum(R1)/roundnum; 
        else
            action_index=otherindex(ceil(rand()*length(otherindex)));
            act_time1(action_index)=act_time1(action_index)+1;
            r=normrnd(q(action_index),1);
            R1(action_index)=R1(action_index)+r;
            Q1(action_index)=R1(action_index)/act_time1(action_index);
            avgr2(roundnum)=avgr2(roundnum)+sum(R1)/roundnum; 
        end
        clear maxindex
        clear otherindex
    end
end