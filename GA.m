clc;
clear all;
close all;

%% initialization 

costfunction=@(x)NQueens(x);

maxgen=50;
npop=15;
nVar = 8;

PMutation=0.3;% Possibility of Mutation 
NMutation=floor((PMutation*npop));

PCrossover=0.7;% Possibility of Crossover 
NCrossover=2*round((PCrossover*npop)/2);

individual.Position=[];
individual.Cost=[];
BestCost=zeros(maxgen,1);

%% Initial population
pop=repmat(individual,npop,1);
for i=1:npop
    pop(i).Position=RandomSol(nVar);
    pop(i).Cost=costfunction(pop(i).Position);
end
a=pop(1).Position;

%% GA Main loop
for gen=1:maxgen    
    %% population Crossover
    popC=repmat(individual,NCrossover,1);
    for k=1:2:NCrossover
        i=randsample(1:npop,2);
        p=pop(i);            
        [Ans1 Ans2]=Crossover_Uniform(p,nVar);            
        popC(k).Position=Ans1;
        popC(k+1).Position=Ans2;         
        popC(k).Cost=costfunction(popC(k).Position);
        popC(k+1).Cost=costfunction(popC(k+1).Position);
    end
    %% population Mutation
    popM=repmat(individual,NMutation,1);
    for k=1:NMutation     
        i=randsample(1:npop,1);
        Mutation_Swap(pop(i).Position,nVar);
        Ans=Mutation_Swap(pop(i).Position,nVar);                
        popM(k).Position=Ans;        
        popM(k).Cost=costfunction(popM(k).Position);        
    end  
    
     %% Pool fusion & Selection Best Chromosome
    pop=[pop
        popC 
        popM];
    costs=[pop.Cost];
    [costs locatsortedcost]=sort(costs);
    pop=pop(locatsortedcost);
    pop=pop(1:npop);
    BestCost(gen)=pop(1).Cost;   
    BestPop(gen,:)= pop(1).Position;
    
end
%% Show Result
disp(['Final Cost --->  ' num2str(BestCost(maxgen))])
disp('---------------------------------------')
ChessBoarder(BestPop,BestCost);

