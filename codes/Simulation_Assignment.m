num= 999
b=[]
A=1
for v = 0:+1:num
   a= fix(rand*2)*A
   if a==0
       a=-1*A
   end
   b=[b,a]
   
end
%x=0:1:1000;
%figure('name','signal')
%plot(x,b)


tsig = b; % vector
dom = [1:length(b)];    % domain

width = 1
for i = length(tsig)-1:-1:2
   tsig = [tsig(1:i-1),tsig(i),tsig(i),tsig(i+1:end)]
   dom = [dom(1:i-1),dom(i)-width/2,dom(i)+width/2,dom(i+1:end)]
end
figure
plot(dom,tsig)
title('transmitted signal')


w=[]
for i=0:1:num
    r = normrnd(0,1)
    w=[w,r]
end


csig= b+w
rsig= b+w

width = 1
for i = length(csig)-1:-1:2
   csig = [csig(1:i-1),csig(i),csig(i),csig(i+1:end)]
   end
figure
plot(dom,csig)
title('received signal with noise')



k=[]
for elm= rsig
    if (elm>=0)
        k=[k,1]
    else
        k=[k,-1]
    end
end

dsig = k ; % vector


width = 1

for i = length(dsig)-1:-1:2
   dsig = [dsig(1:i-1),dsig(i),dsig(i),dsig(i+1:end)]
   end
figure
plot(dom,dsig)
title('decoded signal(after applying threhold)')

%{
save('save_b.mat','b')
save('save_c_sig.mat','c_sig')
save('save_csig.mat','csig')
save('save_dom.mat','dom')
save('save_dsig.mat','dsig')
save('save_k.mat','k')
save('save_rsig.mat','rsig')
save('save_tsig.mat','tsig')
save('save_w.mat','w')
%}
%{
example = matfile('saveA.mat');
C = example.A;
%}