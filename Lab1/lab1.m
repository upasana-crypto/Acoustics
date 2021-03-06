s=importdata('acoustics1_lab1.txt');
s1=timeseries(s);
s1.TimeInfo.StartDate = '09:25:14';
plot(s);

%1. For each of the six train events the corresponding event level LE or SEL shall be determined.
%what should be the value of T for each of the 6 train passages?
title('Percieved sound pressure level db(A) vs time of the day');
xlabel('Time of the day');
ylabel('Percieved sound pressure level db(A)');
datetick('x', 'HH:MM:SS')
SEL=zeros(1828);
p0=2*10^-5;  %reference pressure in pascal
for i=2:length(s)
% s(i)
pres=((s(i)/p0)^2);
% SEL(i)=10*log(integral(@(i)pres,1,i));
end
% plot(SEL);
      % Set format for display on x-axis.

% ts1.Time = ts1.Time - ts1.Time(1);        % Express time relative to the start date.
% 
% plot(ts1)

%2. From the six LE or SEL values from 1. the average event level for each direction shall be calculated.
%just add the SEL of the 3 events in one direction and divide by 3?


%3. Based on the average event levels from 2. and with the number of events per day and night the Leq is calculated for the day and night period.
%is it just *by 200 assuming it is the same value for each event and 34 or
%if not how to extract values for each event ? but what is T here?
Leq=10^0.1*SEL
%4. With help of a statistical evaluation of the unwanted noise during the periods without train events, the uncertainty of the above results shall b