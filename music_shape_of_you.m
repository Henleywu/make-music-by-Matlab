clc,clear 
fs=48000;%����Ƶ��48000(hz)
matric_music= xlsread('shape_of_you.xlsx',1, 'A2:D109');%��ȡExcel�С����ס�����
y=[];%�½�������
x=[];
matric_music_low=xlsread('shape_of_you_low.xlsx',1, 'A2:D73');
%����ת����Ƶ�ʲ���װ�ɺ�����������ú�������
for i=1:1:108
    y1 = tone_note_rythm( matric_music( i, 1),matric_music( i, 2), matric_music( i, 4));
    y = [ y, y1];  %�Ѽ������ӵ�������
end
for i=1:1:72
    x1 = tone_note_rythm( matric_music_low( i, 1),matric_music_low( i, 2), matric_music_low( i, 4));
    x = [ x, x1];  %�Ѽ������ӵ�������
end
if length(y)>=length(x)
    x=[x,zeros(1,length(y)-length(x))]; 
else
    y=[y,zeros(1,length(x)-length(y))];
end
yL = x;
yR = flipud(y);
ystereo = yL+yR;
% m=[x',y'];%������������
% sound(ystereo,fs);%����
%audiowrite('my_music.mp4',ystereo,fs);%дΪmp4�ļ�





