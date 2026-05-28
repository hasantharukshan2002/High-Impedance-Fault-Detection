%% Extract simulation data
Ia   = out.Ia;
tout = out.tout;

%% Resample to uniform sampling (10 kHz)
Fs = 10000;                      % Target sampling frequency
t_uniform = 0:1/Fs:tout(end);

Ia_uniform = interp1(tout, Ia, t_uniform, 'linear');

%% Select steady-state fault region
idx = (t_uniform > 0.12 & t_uniform < 0.18);
Ia_fault = Ia_uniform(idx);

%% Remove DC offset
Ia_fault = Ia_fault - mean(Ia_fault);

%% FFT
N = length(Ia_fault);
Y = fft(Ia_fault);

P2 = abs(Y/N);
P1 = P2(1:floor(N/2)+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:floor(N/2))/N;

%Plot spectrum
% figure
% plot(f, P1, 'LineWidth', 1.5)
% xlim([0 500])
% grid on
% title('HIF Harmonic Spectrum')
% xlabel('Frequency (Hz)')
% ylabel('Magnitude')

[~, idx50] = min(abs(f-50));
Fundamental = P1(idx50);

harmonics = P1(f>60 & f<500);

THD = sqrt(sum(harmonics.^2)) / Fundamental * 100;

disp(['THD = ', num2str(THD), ' %'])