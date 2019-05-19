% generating the signal using the function 'randperm'

number = 100000;
signal = zeros(1,number);            
random_numbers = randperm(number,number/2);       
signal(random_numbers) = ones(1,number/2);           
A = 1; % value of A
signal= signal*A*2 -A

% generating the gaussian noise

noise_mean = 0;
noise_sigma = 4;
noise = normrnd(noise_mean,noise_sigma,[1,number])

% generating the interference

interference_mean = 0;
interference_sigma = 1;
interference = normrnd(interference_mean,interference_sigma,[1,number])

received_signal=signal+noise % r = s + n

decoded_signal= zeros(1,number)

% decoding the received signal using a threshold

threshold=0
for i = 1:number
    if received_signal(i)> threshold                
        decoded_signal(i) = A;
    else
        decoded_signal(i) = -1*A;               
    end
end

% ploting the transmitted signal and the received signal as subplots

x=0:1:number-1;
figure;
subplot(2,1,1);
stairs(x,signal);
title('transmitted signal');
subplot(2,1,2);
stairs(x,decoded_signal)
title('received signal')

% code for the histogram without using built-in function

received_max = max(received_signal);
received_min = min(received_signal);
num_of_bins = 100;
bin_width = (received_max-received_min)/(num_of_bins-1);

bins = [received_min-bin_width/2:bin_width:received_max];
bar_values = zeros(1,num_of_bins);
for i = 1:number
    for j = 1:num_of_bins
        if (received_signal(i) >= bins(j)-bin_width/2) && (received_signal(i) < bins(j)+bin_width/2)
            bar_values(j) = bar_values(j) + 1;
        end
    end
end

%figure;
%bar(bins,bar_values);
%title("Histogram of Received Signal");

% histogram using the built-in function

figure
histogram(received_signal,100)
title("Histogram of Received Signal")


a= received_signal.*((signal+A)/(2*A))
rsig_A= a(a~=0)
a= received_signal.*((-1*signal+A)/(2*A))
rsig_negA= a(a~=0)

figure
histogram(rsig_A,100,'Normalization','probability')
title('received signal with noise, given A is transmitted')
figure
histogram(rsig_negA,100,'Normalization','probability')
title('received signal with noise, given -A is transmitted')
figure
histogram(received_signal,100,'Normalization','probability')
title('received signal with noise')


ex_rsig_A= mean(rsig_A)
ex_rsig_negA= mean(rsig_negA)
ex_rsig= mean(received_signal)


received_signal=signal+noise+interference

a= received_signal.*((signal+A)/(2*A))
rsig_A= a(a~=0)
a= received_signal.*((-1*signal+A)/(2*A))
rsig_negA= a(a~=0)

figure
histogram(rsig_A,100,'Normalization','probability')
title('received signal with noise, given A is transmitted')
figure
histogram(rsig_negA,100,'Normalization','probability')
title('received signal with noise, given -A is transmitted')
figure
histogram(received_signal,100,'Normalization','probability')
title('received signal with noise')


ex_rsig_A= mean(rsig_A)
ex_rsig_negA= mean(rsig_negA)
ex_rsig= mean(received_signal)



