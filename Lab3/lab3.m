clc;
clear all;
receiver1=xlsread('receiver1.xlsx');
receiver2=xlsread('receiver2.xlsx');
receiver3=xlsread('receiver3.xlsx');
t=receiver1(:,1);
t1=1:1:length(t);
imp_sq1_500=receiver1(:,2);
imp_sq1_2000=receiver1(:,3);
imp1_sq1_500=receiver2(:,2);
imp1_sq1_2000=receiver2(:,3);
imp2_sq1_500=receiver3(:,2);
imp2_sq1_2000=receiver3(:,3);
figure;
plot(t1,imp_sq1_500);
hold on;
plot(t1,imp_sq1_2000,'--');
title('Comparison of Impulse Response Square values for 500 Hz and 2 KHz sound frequency');
xlabel('time(ms)');
ylabel('Impulse Response Square');
legend('receiver1-500Hz', 'receiver1-2000Hz')
figure;
plot(t1,imp1_sq1_500);
hold on;
plot(t1,imp1_sq1_2000,'--');
title('Comparison of Impulse Response Square values for 500 Hz and 2 KHz sound frequency');
xlabel('time(ms)');
ylabel('Impulse Response Square');
legend('receiver2-500Hz', 'receiver2-2000Hz')
figure;
plot(t1,imp2_sq1_500);
hold on;
plot(t1,imp2_sq1_2000,'--');
title('Comparison of Impulse Response Square values for 500 Hz and 2 KHz sound frequency');
xlabel('time(ms)');
ylabel('Impulse Response Square');
legend('receiver3-500Hz', 'receiver3-2000Hz')

noise_500=0;
noise_2000=0;
noise1_500=0;
noise1_2000=0;
noise2_500=0;
noise2_2000=0;

for j=2000:1:length(t)
    noise_500=noise_500+imp_sq1_500(j);
    noise_2000=noise_2000+imp_sq1_2000(j);
    noise1_500=noise1_500+imp1_sq1_500(j);
    noise1_2000=noise1_2000+imp1_sq1_2000(j);
    noise2_500=noise2_500+imp2_sq1_500(j);
    noise2_2000=noise2_2000+imp2_sq1_2000(j);
end

avg_noise_500=noise_500/(length(t)-2000);
avg_noise1_500=noise1_500/(length(t)-2000);
avg_noise2_500=noise2_500/(length(t)-2000);
avg_noise_2000=noise_2000/(length(t)-2000);
avg_noise1_2000=noise1_2000/(length(t)-2000);
avg_noise2_2000=noise2_2000/(length(t)-2000);

for i=1:1:length(t)
    s1_500_notdb(i)=imp_sq1_500(i)-avg_noise_500;
    s1_2000_notdb(i)=imp_sq1_2000(i)-avg_noise_2000;
    s2_500_notdb(i)=imp1_sq1_500(i)-avg_noise1_500;
    s2_2000_notdb(i)=imp1_sq1_2000(i)-avg_noise1_2000;
    s3_500_notdb(i)=imp2_sq1_500(i)-avg_noise2_500;
    s3_2000_notdb(i)=imp2_sq1_2000(i)-avg_noise2_2000;
end

Nr1_500=0;
Den1_500=0;
Nr2_500=0;
Den2_500=0;
Nr3_500=0;
Den3_500=0;
Nr1_2000=0;
Den1_2000=0;
Nr2_2000=0;
Den2_2000=0;
Nr3_2000=0;
Den3_2000=0;


Rt1_500=zeros(1,3001);
Rt1_2000=zeros(1,3001);
Rt2_500=zeros(1,3001);
Rt2_2000=zeros(1,3001);
Rt3_500=zeros(1,3001);
Rt3_2000=zeros(1,3001);

Rt1_500(3001:-1:1)=10*log10(cumsum(s1_500_notdb(3001:-1:1))/sum(s1_500_notdb(1:3001)));
Rt2_500(3001:-1:1)=10*log10(cumsum(s2_500_notdb(3001:-1:1))/sum(s2_500_notdb(1:3001)));
Rt3_500(3001:-1:1)=10*log10(cumsum(s3_500_notdb(3001:-1:1))/sum(s3_500_notdb(1:3001)));
Rt1_2000(3001:-1:1)=10*log10(cumsum(s1_2000_notdb(3001:-1:1))/sum(s1_2000_notdb(1:3001)));
Rt2_2000(3001:-1:1)=10*log10(cumsum(s2_2000_notdb(3001:-1:1))/sum(s2_2000_notdb(1:3001)));
Rt3_2000(3001:-1:1)=10*log10(cumsum(s3_2000_notdb(3001:-1:1))/sum(s3_2000_notdb(1:3001)));
figure;
plot(t,Rt1_500,'r');
hold on;
plot(t,Rt2_500,'b');
hold on;
plot(t,Rt3_500,'g');
xlabel('time(s)');
ylabel('Impulse Response Square (dB)');
title('RT for 500Hz signal for receiver 1,2 and 3');
legend('Receiver1', 'Receiver2','Receiver3');
figure;
plot(t,Rt1_2000,'r');
hold on;
plot(t,Rt2_2000,'b');
hold on;
plot(t,Rt3_2000,'g');
xlabel('time(s)');
ylabel('Impulse Response Square (dB)');
title('RT for 2000Hz signal for receiver 1,2 and 3');
legend('Receiver1', 'Receiver2','Receiver3');

for l=32:1:112
    Nr1_500=Nr1_500+s1_500_notdb(l);
end
for m=112:1:3001
    Den1_500=Den1_500+s1_500_notdb(m);
end
for n=32:1:112
    Nr1_2000=Nr1_2000+s1_2000_notdb(n);
end
for o=112:1:3001
    Den1_2000=Den1_2000+s1_2000_notdb(o);
end
for p=50:1:130
    Nr2_500=Nr2_500+s2_500_notdb(p);
end

for q=130:1:3001
    Den2_500=Den2_500+s2_500_notdb(q);
end
for r=48:1:128
    Nr2_2000=Nr2_2000+s2_2000_notdb(r);
end
for s=128:1:3001
    Den2_2000=Den2_2000+s2_2000_notdb(s);
end
for t=100:1:180
    Nr3_500=Nr3_500+s3_500_notdb(t);
end

for u=180:1:3001
    Den3_500=Den3_500+s3_500_notdb(u);
end
for v=73:1:153
    Nr3_2000=Nr3_2000+s3_2000_notdb(v);
end
for w=153:1:3001
    Den3_2000=Den3_2000+s3_2000_notdb(w);
end

C80_500_r1=10*log10(Nr1_500/Den1_500)
C80_500_r2=10*log10(Nr2_500/Den2_500)
C80_500_r3=10*log10(Nr3_500/Den3_500)
C80_2000_r1=10*log10(Nr1_2000/Den1_2000)
C80_2000_r2=10*log10(Nr2_2000/Den2_2000)
C80_2000_r3=10*log10(Nr3_2000/Den3_2000)

