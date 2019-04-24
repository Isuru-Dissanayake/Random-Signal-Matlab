alpha=2

rsig_amp= (b*alpha)+w
figure
histogram(rsig_amp,20,'Normalization','probability')
title('amplified received signal with noise')


rsig_amp_A=[]
rsig_amp_negA=[]
u=1

for elm = b
    %rsig_withI(u)
    if (elm==A)
        rsig_amp_A=[rsig_amp_A,rsig_amp(u)]
    else
        rsig_amp_negA=[rsig_amp_negA,rsig_amp(u)]
    end
    u=u+1
    
    
end
figure
histogram(rsig_amp_A,20,'Normalization','probability')
title('amplified received signal given that A is transmitted')
figure
histogram(rsig_amp_negA,20,'Normalization','probability')
title('amplified received signal given that -A is transmitted')
ex_rsig_A= mean(rsig_amp_A)
ex_rsig_negA= mean(rsig_amp_negA)
ex_rsig= mean(rsig_amp)