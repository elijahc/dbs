close all
% 
% root = 'patient_STN';
% files = {strcat(root,string(patient), 'pat'};
load('patient1_STN3.mat');

Fs=1375;
nwin = 64;
nlap = 32;

wind = kaiser(nwin,12);
             
% for patient = 1:1
% 
%     for rec = 1:4
%     
% sig = filtfilt(notch,double(CLFP_01));
raw_sig = CLFP_01;
fsig = ACnotch(raw_sig);

msig = ACnotch(CMacro_LFP_01);
% fsig = filter(bpf300, sig);
% msig = filter(bpf300, msig);
% fsig = sig;
% 
% figure
% subplot(2,1,1)
% plot(raw_sig);
% subplot(2,1,2)
% plot(fsig);

% bsig = filter(beta_band, fsig);
% gsig = filter(gamma_filt,fsig);
% tsig = filter(theta_filt,fsig);
% all_sig = [tsig;bsig;gsig];
% titles = {"theta\_band";"beta\_band";"gamma\_band"};
% F = [4,10;15,45;50,90];
F=2:300;

spectrogram(fsig,wind,nlap,5:300,Fs,'yaxis');
% SpectrogramExample(fsig,Fs)

spts = {};

figure
for k = 1:3
    idxs = [2*k-1,2*k];
    ts = subplot(4,2,idxs(1));
    plot(all_sig(k,:));
    title(ts,titles(k));

    
    spd = subplot(4,2,idxs(2));
    spectrogram(all_sig(k,:),wind,nlap,2:300,Fs,'yaxis');
    title(spd,titles(k));
end
subplot(4,2,[7,8])
plot(sig);

% 
% for k = 1:3
%     subplot(4,1,k)
%     spectrogram(all_sig(k,:),wind,nlap,F,Fs,'yaxis');
%     title(titles(k));
% end
% subplot(4,1,4)
% plot(fsig);
