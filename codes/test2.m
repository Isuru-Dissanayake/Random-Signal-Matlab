I=[]
for i=0:1:num
    r = normrnd(0,1)
    I=[I,r]
end

rsig_withI= b+w+I
figure
histogram(rsig_withI,20,'Normalization','probability')

rsig_withI_A=[]
rsig_withI_negA=[]
u=1

for elm = b
    %rsig_withI(u)
    if (elm==A)
        rsig_withI_A=[rsig_withI_A,rsig_withI(u)]
    else
        rsig_withI_negA=[rsig_withI_negA,rsig_withI(u)]
    end
    u=u+1
    
    
end
figure
histogram(rsig_withI_A,20,'Normalization','probability')
title('received signal with noise and interference, given that A is transmitted')
figure
histogram(rsig_withI_negA,20,'Normalization','probability')
title('received signal with noise and interference, given that -A is transmitted')

ex_rsig_A= mean(rsig_withI_A)
ex_rsig_negA= mean(rsig_withI_negA)
ex_rsig= mean(rsig_withI)