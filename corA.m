function a=corA(v)  %Define the formation constant a
if v<=200
    a=1.44607-0.00164*v;
end
if v>200&&v<=400
    a=1.2598-6.54E-4*v;
end
if v>400
    a=1.0892-2.42E-4*v;
end