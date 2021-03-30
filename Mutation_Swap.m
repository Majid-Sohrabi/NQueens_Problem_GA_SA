function q=Mutation_Swap(q,nVar)
Point=randsample(1:nVar-1,1);
q([Point,Point+1])=q([Point+1,Point]);
end