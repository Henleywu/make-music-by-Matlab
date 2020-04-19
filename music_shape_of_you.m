clc,clear 
fs=48000;%采样频率48000(hz)
matric_music= xlsread('shape_of_you.xlsx',1, 'A2:D109');%读取Excel中“乐谱”数据
y=[];%新建空数组
x=[];
matric_music_low=xlsread('shape_of_you_low.xlsx',1, 'A2:D73');
%音符转换成频率并封装成函数，下面调用函数即可
for i=1:1:108
    y1 = tone_note_rythm( matric_music( i, 1),matric_music( i, 2), matric_music( i, 4));
    y = [ y, y1];  %把计算结果加到数组里
end
for i=1:1:72
    x1 = tone_note_rythm( matric_music_low( i, 1),matric_music_low( i, 2), matric_music_low( i, 4));
    x = [ x, x1];  %把计算结果加到数组里
end
if length(y)>=length(x)
    x=[x,zeros(1,length(y)-length(x))]; 
else
    y=[y,zeros(1,length(x)-length(y))];
end
yL = x;
yR = flipud(y);
ystereo = yL+yR;
% m=[x',y'];%左右声道分离
% sound(ystereo,fs);%播放
%audiowrite('my_music.mp4',ystereo,fs);%写为mp4文件





