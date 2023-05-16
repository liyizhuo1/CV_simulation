function[C]=cc(R,x,k,kvv,Er)  %Calculated capacity,R:average radius,x:number of holes,k:scale bar
% kvv:thickness of oxide film at transforming voltage;e:dielectric constant
h=50*10^(-6);             %Average height
R=R*10^(-6);
kvv=kvv*10^(-6);
R=(1*R)-0.39*kvv;
SA=2*pi*R*h;             %Average area per pit  
S=SA*x;
sc=(k*960*10^-6)*(k*1280*10^-6);      %Surface capacitance
S=S+sc;
y=(5*10^-4)/sc;
C=((8.854*10^(-6))*Er*S)/kvv;  %Calculation of C from the dielectric constant
C=C*y*2;
Ch=(120*10^(-6))*(6*10^(-2))*(8.854*10^(-6))*Er/kvv;  %Side capacitance
C=C+Ch;
