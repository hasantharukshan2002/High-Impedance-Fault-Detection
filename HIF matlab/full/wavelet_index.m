function HF_index = wavelet_index(signal, Fs)

[C,L] = wavedec(signal,4,'db4');
D1 = detcoef(C,L,1);
D2 = detcoef(C,L,2);

HF_energy = sum(D1.^2) + sum(D2.^2);
Total_energy = sum(signal.^2);

HF_index = HF_energy;

end