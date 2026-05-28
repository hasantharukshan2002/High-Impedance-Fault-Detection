%% Add Measurement Noise

SNR_dB = 30;   % Try 30 dB first (moderate noise)

signal_clean = Ia_uniform;

signal_noisy = awgn(signal_clean, SNR_dB, 'measured');

Ia_uniform = signal_noisy;   % Replace signal with noisy version
%% Sliding Window Wavelet Detection

Fs = 10000;              % Sampling frequency
window_size = 0.02;      % 1 cycle (20 ms)
step_size = 0.005;       % 5 ms step

N_window = round(window_size * Fs);
N_step   = round(step_size * Fs);

signal = Ia_uniform;     % Use resampled signal
t = t_uniform;

threshold = 0.01;        % Detection threshold

HF_index_array = [];
time_array = [];

i = 1;

while (i + N_window - 1) <= length(signal)
    
    segment = signal(i : i+N_window-1);
    segment = segment - mean(segment);
    
    [C,L] = wavedec(segment,5,'db4');
    
    D1 = detcoef(C,L,1);
    D2 = detcoef(C,L,2);
    D3 = detcoef(C,L,3);
    
    HF_energy = sum(D1.^2) + sum(D2.^2) + sum(D3.^2);
    total_energy = sum(segment.^2);
    
    HF_index = HF_energy / total_energy;
    
    HF_index_array = [HF_index_array HF_index];
    time_array = [time_array t(i)];
    
    i = i + N_step;
end
figure
plot(time_array, HF_index_array, 'LineWidth', 1.5)
hold on
yline(threshold, 'r--', 'Threshold')
xlabel('Time (s)')
ylabel('Wavelet HF Index')
title('Sliding Window HIF Detection')
grid on