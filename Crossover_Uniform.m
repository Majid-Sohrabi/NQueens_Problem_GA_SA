function [Ans1 Ans2]=Crossover_Uniform(p,nVar)
Mask=randsample(0:1,nVar,1);
Ans1=p(1).Position;
Ans2=p(2).Position;
for i=1:nVar
    if(Mask(i)==0)
        temp=Ans1(i);
        Ans1(i)=Ans2(i);
        Ans2(i)=temp;
    end
end 
end