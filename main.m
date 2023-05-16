clear;              %Simulation to calculate CV at different formation voltages
clc;
v=[200:1:600];
k2=30/465;                %Scale unit: micron/pixel
k4=20/620;
k10=10/772;
jingdu=k2;  
Er=cell2mat(struct2cell(load('Er-after correction.mat')));
capacitor=zeros(3,401);
data=imread('Sample2(x2.0k).png'); %Extracting images and binarizing them
[QY,QYT]=quyu(data);          %Distinguish pits, aluminum substrate areas
for i=200:1:600
a=corA(i);
ko=((v(1,i-199)*(a*(10^-9))))/(jingdu*10^-6);  %Pixels occupied by oxide film at formation voltage
kor=ko*jingdu;                     %Actual thickness of oxide film (¦Ìm)
kv=round((2.2*ko)^2);        
QYT2=bwareaopen(QYT,kv,8);    %Removal of areas smaller than required for oxide film area (8 neighborhoods)
[bw,num]=bwlabel(QYT2,8);   
R=regionprops(QYT2,'basic');
R1=[R.Area];
R2=sqrt(R1);
R2=R2*jingdu;   %Calculate the diameter of each area
S=mean(R1);
TS=S*jingdu*jingdu;  %Calculate the average area
S=sqrt(S);
TR=S*jingdu;   %Calculate the average diameter
imshow(QYT2);
capacitor(1,:)=v;
capacitor(2,i-199)=cc(TR/2,size(R1,2),k2,kor,Er(1,i-199));  %Calculate simulation capacity
capacitor(3,i-199)=capacitor(2,i-199)*capacitor(1,i-199);   %Calculate CV
end
plot(capacitor(1,:),capacitor(3,:)) ;
hold on
x=[213.2 256.2 317.1 361.5 409.6 420.9 499 546.8 595.7]; %Sample 2 Experimental CV data
y=[13.15 10.58 8.04 6.58 5.45 5.26 4.12 3.63 3.12];
y=y*10^-6;
z=x.*y;
plot(x,z,'*m','markersize',15);
hold off
legend('Simulation CV','Experimental CV');
