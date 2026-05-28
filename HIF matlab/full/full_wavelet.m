clear
clc
close all

% Run Simulink model automatically
out = sim('HIF_Grid_Model');
%% Get simulation data

Ia   = out.Ia;
Ib = out.Ib.Data;
Ic = out.Ic.Data;
tout = out.tout;

%% 2️⃣ Resample
Fs_target = 10000;
t_uniform = 0:1/Fs_target:tout(end);

Ia_u = interp1(tout, Ia, t_uniform, 'linear');
Ib_u = interp1(tout, Ib, t_uniform, 'linear');
Ic_u = interp1(tout, Ic, t_uniform, 'linear');

%% 3️⃣ Sliding window
window_length = 0.02;   % 20 ms
step = 0.01;            % 10 ms
samples_per_window = round(window_length*Fs_target);
step_samples = round(step*Fs_target);

threshold = 0.01;

counter = 1;

for k = 1:step_samples:length(Ia_u)-samples_per_window

    idx = k:k+samples_per_window-1;

    HF_A(counter) = wavelet_index(Ia_u(idx), Fs_target);
    HF_B(counter) = wavelet_index(Ib_u(idx), Fs_target);
    HF_C(counter) = wavelet_index(Ic_u(idx), Fs_target);

    time_axis(counter) = t_uniform(k);

    counter = counter + 1;

end
% Ignore first 0.08 s (startup transient)
valid_indices = time_axis > 0.08;

HF_A = HF_A(valid_indices);
HF_B = HF_B(valid_indices);
HF_C = HF_C(valid_indices);
time_axis = time_axis(valid_indices);
detected_phase = zeros(size(HF_A));

for i = 1:length(HF_A)

    [max_val, idx] = max([HF_A(i), HF_B(i), HF_C(i)]);

    if max_val > threshold
        detected_phase(i) = idx;   % 1=A, 2=B, 3=C
    else
        detected_phase(i) = 0;     % No fault
    end

end
%% Decision Timer (3 consecutive windows)

N_confirm = 3;
final_detect = 0;
detection_time = 0;

for i = 1:length(detected_phase)-N_confirm
    if detected_phase(i) ~= 0 && ...
       all(detected_phase(i:i+N_confirm-1) == detected_phase(i))
       
        final_detect = detected_phase(i);
        detection_time = time_axis(i) + window_length/2;
        break
    end
end
if final_detect ~= 0
    phase_name = {'A','B','C'};
    fprintf('Fault detected on Phase %s at %.4f s\n', ...
            phase_name{final_detect}, detection_time);
else
    fprintf('No fault detected\n');
end
%% 4️⃣ Plot
plot(time_axis, HF_A, 'r')
hold on
plot(time_axis, HF_B, 'g')
plot(time_axis, HF_C, 'b')
yline(threshold,'k--')
legend('Phase A','Phase B','Phase C','Threshold')
xlabel('Time (s)')
ylabel('Wavelet HF Index')
title('Three-Phase HIF Detection')
grid on

