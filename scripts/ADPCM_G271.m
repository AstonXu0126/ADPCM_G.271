% main function
clc
clear

coe=[1,0,1,0,0,0,0,0,0,0,0];          %��ʼ��ϵ��
coe1=[0,0,0] ;
coe2=[0,0,0,0,0,0,0,0,0,0];
coe3=[0];
Dqk=zeros(1,7);

fid = fopen(fullfile(G271RootPath,'data','ExampleAudioInput2.txt'),'rt');    %���ļ����ļ���ʽΪ.txt
a=fscanf(fid,'%e\n');
fclose(fid);
%fid=('ling11.wav');wavwrite(44100,fid);  %ת����wav��ʽ��Ƶ�ļ�

fid = fopen(fullfile(G271RootPath,'data','ExampleAudioOutput2.txt'),'wt');
for  i = 1:size(a,1)
    Slk=a(i);     %�����ź�
    [coe,coe1,coe2,coe3,Dqk] = adpcm(Slk,coe,coe1,coe2,coe3,Dqk);  
    %������������뺯��
    fprintf(fid,'%f\n',coe2(5));
end
fclose(fid)

%---------------������ʾ--------------
fid = fopen(fullfile(G271RootPath,'data','ExampleAudioInput2.txt'),'rt');
a=fscanf(fid,'%e\n');
fid = fopen(fullfile(G271RootPath,'data','ExampleAudioOutput2.txt'),'rt');
b=fscanf(fid,'%e\n');
subplot(211),plot(a);
title('������������');
subplot(212),plot(b);
title('�����������');
   

