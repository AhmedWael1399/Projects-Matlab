%Generate a random sequence of bits (Zeros and Ones)
seq = randi([0 1],1e6,1);

%Counter for BER Array and SNR Array indeces
count = 1;

%Apply noise to the generated sequence of bits
for m = 0:2:30
    matrix = awgn(seq,m,'measured');
    BER = 0;
    
    %Setting or clearing bits according to addition of noise to sequence
    for n = 1:1:1e6
        if matrix(n) < 0.5
            matrix(n) = 0;
        else
            matrix(n) = 1;
        end
    end
    
    %Identify the BER
    for n = 1:1:1e6
        if seq(n) ~= matrix(n)
            BER = BER + 1;
        end
    end
    %Adding the BER to the BER Array
    BERMatrix(count) = BER;
    
    %Adding the SNR value to the SNR Array
    SNRArray(count) = m;
    
    count = count + 1;
end

%Plotting the logarithmic Graph
semilogy(SNRArray,BERMatrix);
signalPower = sum(seq);
grid on
