function[QY,QYT]=quyu(data)
gdata=rgb2gray(data);
imshow(gdata);
lie=size(gdata,2);   %Calculate the average grayscale of the image
hang=size(gdata,1);
sumdata=0;
for i=1:1:hang
    for j=1:1:lie
        sumdata=sumdata+double(gdata(i,j));
    end
end
advdata=sumdata/(hang*lie);
newgdata=gdata;       %Distinguish the black part
newdata=data;
black=0;
QYT=zeros(hang,lie);
for i=1:1:hang
    for j=1:1:lie
        if newgdata(i,j)<=(advdata*0.85)  %Judgment of hole area
            QYT(i,j)=128;
            newdata(i,j,:)=[255,0,0];
            black=black+1;
        end
        if newgdata(i,j)>(0.85*advdata)     %Determination of aluminum substrate area
            QYT(i,j)=0;
        end
    end
end
imshow(newdata);
areab=black;  %Give the area of the hole and aluminum substrate respectively
areaAl=hang*lie-black;
QY=[areab areaAl];
