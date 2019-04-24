rsig_A=[]
rsig_negA=[]
u=1
for elm = b
    rsig(u)
    if (elm==A)
        rsig_A=[rsig_A,rsig(u)]
    else
        rsig_negA=[rsig_negA,rsig(u)]
    end
    u=u+1
    
    
end
figure
histogram(rsig_A,20,'Normalization','probability')
title('received signal with noise, given A is transmitted')
figure
histogram(rsig_negA,20,'Normalization','probability')
title('received signal with noise, given -A is transmitted')
figure
histogram(rsig,20,'Normalization','probability')
title('received signal with noise')

ex_rsig_A= mean(rsig_A)
ex_rsig_negA= mean(rsig_negA)
ex_rsig= mean(rsig)