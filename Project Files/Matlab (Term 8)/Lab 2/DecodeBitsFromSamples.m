function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,case_type,fs)
%
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      The sampling frequency used to generate the sample sequence
%   fs:             The bit flipping probability
% Outputs:
%   rec_sample_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence

if (nargin <= 2)
    fs = 1;
end

switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
       rec_bit_seq = rec_sample_seq;
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE
        counter = 1;
        for i = 1:length(rec_sample_seq)/fs
            counter_zeros = 0;
            counter_ones = 0;
          for j = 1:fs
              if(rec_sample_seq(counter) == 0)
                  counter_zeros = counter_zeros + 1;
              else
                  counter_ones = counter_ones + 1;
              end
                  counter = counter + 1;
          end
          if(counter_zeros > counter_ones)
              rec_bit_seq(i) = 0;
          else
              rec_bit_seq(i) = 1;
          end
        end
        %%%
    case 'part_3'
        %%% WRITE YOUR CODE FOR PART 3 HERE
        counter = 1;
        for i = 1:length(rec_sample_seq)/fs
              rec_bit_seq(i) = rec_sample_seq(counter);
              counter = counter + fs;
        end
        %%%
end