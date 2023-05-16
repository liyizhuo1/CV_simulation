function e=corepsilon(v,kvv,S) %v: chemistry voltage, kvv: thickness of oxide film at chemistry voltage, 
% S: surface area of 5cm2 aluminum foil oxide at chemistry voltage
    x1=[107.2 132.6 157.1 174.9 199.4];
    c1=[22.82 19.22 16.61 14.79 13.45];
    e1=(c1*kvv)/(S*8.854e-6);
    t1=polyfit(x1,e1,3);
    x2=[199.4 241.4 247.2 286 300.4 339.4 345.6 384.4 400];
    c2=[13.45 11.44 10.39 8.92 8.21 7.31 6.84 6.12 5.7];
    e2=(c2*kvv)/(S*8.854e-6);
    t2=polyfit(x2,e2,3);
    x3=[400 417.2 436.7 474 482.8 525.9 533.1 575.9 577.4];
    c3=[5.7 5.53 4.98 4.58 4.31 3.97 3.63 3.44 3.29];
    e3=(c3*kvv)/(S*8.854e-6);
    t3=polyfit(x3,e3,3);
if v<=200
    e=t1(1,4)+t1(1,3)*v+t1(1,2)*v^2+t1(1,1)*v^3;
end
if v>200&&v<=400
    e=t2(1,4)+t2(1,3)*v+t2(1,2)*v^2+t2(1,1)*v^3;
end
if v>400
    e=t3(1,4)+t3(1,3)*v+t3(1,2)*v^2+t3(1,1)*v^3;
end
e=e*10^(-6);
