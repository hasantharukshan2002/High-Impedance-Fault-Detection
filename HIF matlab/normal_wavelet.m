%% NORMAL CONDITION (before fault)
idx_normal = (t_uniform > 0.02 & t_uniform < 0.08);
Ia_normal = Ia_uniform(idx_normal);

signal = Ia_normal;

[C,L] = wavedec(signal, 5, 'db4');

D1 = detcoef(C,L,1);
D2 = detcoef(C,L,2);
D3 = detcoef(C,L,3);

E1 = sum(D1.^2);
E2 = sum(D2.^2);
E3 = sum(D3.^2);

HF_Energy_normal = E1 + E2 + E3;
TotalSignalEnergy_normal = sum(signal.^2);

HF_Index_normal = HF_Energy_normal / TotalSignalEnergy_normal;

disp(['Normal Wavelet Energy Index = ', num2str(HF_Index_normal)])