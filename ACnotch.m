function y = ACnotch(x)

Fs = 1375;
notch_filt = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',58,'HalfPowerFrequency2',62, ...
               'DesignMethod','butter','SampleRate',Fs);
           
s = double(x);
y = filtfilt(notch_filt,s);
end