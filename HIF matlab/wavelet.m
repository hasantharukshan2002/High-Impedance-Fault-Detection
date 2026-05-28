%% Wavelet decomposition
signal = Ia_fault;   % your fault signal

level = 5;
wname = 'db4';

[C,L] = wavedec(signal, level, wname);

D1 = detcoef(C,L,1);
D2 = detcoef(C,L,2);
D3 = detcoef(C,L,3);

% High-frequency energies
E1 = sum(D1.^2);
E2 = sum(D2.^2);
E3 = sum(D3.^2);

HF_Energy = E1 + E2 + E3;

disp(['High-Frequency Energy = ', num2str(HF_Energy)])

%% 🔥 ADD THIS PART RIGHT HERE
TotalSignalEnergy = sum(signal.^2);

HF_Index = HF_Energy / TotalSignalEnergy;

disp(['Wavelet Energy Index = ', num2str(HF_Index)])