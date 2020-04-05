clc;clear all; close all
coordyS = 201;
coordyT= 365
coordxS=407
coordxT=574


coordyS1 = 301;
coordyT1= 465
coordxS1=707
coordxT1=874
img = imread('maxresdefault.jpg');
window = img(201:365,407:574,:);
window1 = img(301:465,707:874,:);

DelayTime=0.2;
figure
imshow(img); imshow(img);
h = figure(1)
hold on; axis tight manual % this ensures that getframe() returns a consistent size


% xlim([min(x) max(x)]), ylim([min(y) max(y)])

% cm = jet(size(x,2));
filename = 'out.gif';
number = 102
sigma = linspace(0.001,3,number)
c=0;
for i=1:number
    try
        img1 = img;
        window = cv.GaussianBlur(window,'SigmaX',sigma(i));
        window1 = cv.GaussianBlur(window1,'SigmaX',sigma(i));
        
        img1(coordyS:coordyT,coordxS:coordxT,:)=window;
        img1(coordyS1:coordyT1,coordxS1:coordxT1,:)=window1;
        
        coordxS = coordxS - 4;
        coordxT = coordxT - 4;
        coordyS=coordyS - 1;
        coordyT=coordyT - 1;
        
        coordxS1 = coordxS1 + 4;
        coordxT1 = coordxT1 + 4;
        coordyS1=coordyS1 + 1;
        coordyT1=coordyT1 + 1;
        imshow(img1);
        gif_generator(h,filename,i,DelayTime)
        c= c+1;
    catch
        c
    end
end





