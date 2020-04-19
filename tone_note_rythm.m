function  y  = tone_note_rythm( tone,note,rythm )
%tone 音调  note音符  rythm 节奏
Fs=48000;%采样频率
freqs= [110,123,138,146,164,184,207,0]*4;
% x=linspace( 0, 2*pi*rythm, floor(Fs*rythm));
% y=sin(freqs(note)*x*tone).*(1-x/(2*rythm*pi));

y0 = zeros(1,floor(Fs*rythm*0.05));
x1 = linspace( 2 *pi *rythm *0.05, 2 *pi *rythm *0.1, floor(Fs*rythm*0.05));
y1 =sin(freqs(note)*x1*tone).* log(((exp(1)-1)/( 0.05 *2 *rythm *pi)*(x1 -0.05 *2 *rythm *pi)+1));
x2 = linspace( 2 *pi *rythm *0.1, 2 *pi *rythm *0.8, floor(Fs*rythm*0.7));
y2 = sin(freqs(note)*x2*tone).*(1./((x2 - 0.1 *2 *pi *rythm)/(0.7 *2 *pi *rythm)+1));
x3 = linspace( 2 *pi *rythm *0.8, 2 *pi *rythm *1, floor(Fs*rythm*0.2));
y3 =sin(freqs(note)*x3*tone).*(-0.5*tan(pi* x3 /(0.8 * 2 *pi *rythm)- 1.25* pi ));
y =[y0, y1, y2, y3];
end


