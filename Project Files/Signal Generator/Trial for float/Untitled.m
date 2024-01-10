clc , clear , close all
msg1 =( ' >>General Signal Generator<< ' );
disp (msg1)
frequencySampling1 = input ( ' Enter the Sampling Frequency of the signal:  ', 's' );
%frequencySamplying = strcat (frequencySampling,('s'));
frequencySampling = str2double(frequencySampling1);
startTimeScale = input ( ' Enter the start of the time scale:  ','s' );
startTimeScale = str2double(startTimeScale);
endTimeScale = input ( ' Enter the end of the time scale:  ','s' );
endTimeScale = str2double(endTimeScale);
breakPointNumber = input ( ' Enter the number of break points:  ','s' );
breakPointNumber = str2double(breakPointNumber);
start = startTimeScale;
signalTotal = 0;

for i = 1:(breakPointNumber + 1)
    userBreakPoint = endTimeScale;
    fprintf ( ' Created Signal \n ' );
    
   if (i ~= (breakPointNumber + 1))
       userBreakPoint = input ( ' Enter the break point position: ','s' );
       userBreakPoint = str2double (userBreakPoint);
   end
   
    fprintf ( ' 1- DC Signal \n 2- Ramp Signal \n 3- General Order Polynomial \n 4- Exponential Signal \n 5- Sinusoidal Signal \n ');
    signalType = input ( ' Choose the type of signal you want: ');
    t = linspace(start,userBreakPoint,(userBreakPoint - start) * frequencySampling);
   
    switch (signalType)
        
        case 1
            amp = input ( ' Enter the amplitude of the signal: ');
            amp = str2double(amp);
            n = (userBreakPoint - start) * frequencySampling;
            x = amp*ones(1,n);
            x = str2double(x);
        case 2
            slope = input( ' Enter slope: ');
            intercept = input( ' Enter the intercept with x-axis: ');
            x = slope * (t-intercept);
        case 3
            numberCoefficient = input ( ' Enter the number of coefficients: ');
            power = numberCoefficient - 1;
            x = 0;
            
            for j = 1:(numberCoefficient)
                coefficient = input ( ' Enter coefficient: ' );
                x = x + coefficient * t.^power;
                power = power - 1;
            end
            
             
        case 4
             amp = input ( ' Enter the amplitude of the signal: ');
             exponent = input ( ' Enter the exponent: ' );
             x = amp * exp(exponent * t );
        case 5
             amp = input ( ' Enter the amplitude of the signal: ');
             frequency = input( ' Enter the frequency: ');
             phase = input( ' Enter the phase: ');
             x = amp * sin((2 * pi * frequency * t) + deg2rad(phase));
            
            
    end
    
start = userBreakPoint;
signalTotal = [signalTotal x];
end

T = linspace(startTimeScale,endTimeScale,(frequencySampling*((endTimeScale-startTimeScale))+1));
figure
plot (T, signalTotal)
title( ' The Desired Signal ' );
msg2 =( ' >Operations on Created Signal< ' );
disp (msg2)
operationNumber = input( ' Enter the number of operations you want to do: ' );

for k = 1:(operationNumber)
    
 fprintf ( '1- Amplitude Scaling \n 2- Time Reversal \n 3- Time Shift \n 4- Expanding the signal \n 5- Compressing the signal \n 6- None \n ');
 option = input( ' Choose the number of the operation you want: ' );
   
 switch (option)
     
        case 1
            amp = input ( ' Enter the new amplitude of the signal: ');
            signalTotal = amp * signalTotal;
        case 2
            T = -t;
        case 3
            phaseShift = input ( ' Enter the value of the shift: ' );
            T = t + phaseShift;
        case 4
             expansion = input ( ' Enter the value of expansion: ' );
             T = t * expansion;
        case 5
             compression = input ( ' Enter the value of compression: ' );
             T = t / compression;
        case 6
            break;
 end
    
end
T = linspace(startTimeScale,endTimeScale,(frequencySampling*((endTimeScale-startTimeScale))+2));
    figure
    plot(T,signalTotal)
    title( ' The Modified Signal ' );
    fprintf ( ' >>Thank You<< ');