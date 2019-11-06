function [avgr1]=greedy(Q,q,act_time,R,avgr1)
    for roundnum=1:1000
        Q1=sort(Q,'descend');
        m=Q1(1);
        k=1;
        for i=1:10
            if Q(i)==m
               maxindex(k)=i;
               k=k+1;
            end
        end
        if length(maxindex)~=1
            action_index=maxindex(ceil(rand()*length(maxindex)));
        else
            action_index=maxindex(1);
        end
        clear maxindex
        act_time(action_index)=act_time(action_index)+1;
        r=normrnd(q(action_index),1);
        R(action_index)=R(action_index)+r;
        Q(action_index)=R(action_index)/act_time(action_index);
        avgr1(roundnum)=avgr1(roundnum)+sum(R)/roundnum;
    end 
end