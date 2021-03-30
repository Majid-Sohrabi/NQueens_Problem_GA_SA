clc;
clear all;
close all;

%% Problem Definition

costfunction=@(x)NQueens(x);     % Cost Function

nVar = 8;    % Number of Decision Variables

VarSize = [1 nVar];    %Decision Variable Matrix Size

VarMin = 1;      % Decision Variable lower bound
VarMax = 8;       % Decision Variable lower bound

%% SA Parameters

maxgen=500;
T0=1000;
alpha=0.8;

%% Initialization

x.Position=RandomSol(nVar);
x.Cost=costfunction(x.Position);
BestSol=x;
BestCost=zeros(maxgen,1);
T=T0;

%% SA loop
for gen=1:maxgen   
       % xnew.Position=Mutation(5,x.Position,model);
        xnew.Position=Mutation_Swap(x.Position,nVar);
        xnew.Cost=costfunction(xnew.Position);
       if (xnew.Cost<=x.Cost)
           x=xnew;
       else           
           delta=xnew.Cost-x.Cost;           
           p=exp(-delta/T);
           h=rand();                     
           if(p>=h)
                  x=xnew;                   
           end
       end
       if(x.Cost <=BestSol.Cost)
           BestSol=x;
       end           
    BestCost(gen)=x.Cost; 
     BestPop(gen,:)= x.Position;
    T=alpha*T; 
end

%% Result
disp(['Final Cost --->  ' num2str(BestCost(maxgen))])
disp('---------------------------------------')
ChessBoarder(BestPop,BestCost);
