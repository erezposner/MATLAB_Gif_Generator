clc;clear all; close all
% x = 1:20';
% y = rand(size(x,2),1);
DelayTime=0.1;
h = figure; hold on; axis tight manual % this ensures that getframe() returns a consistent size

 images = dir([pwd,'\img\*.png']);
images = images(~[images.isdir]);;
[~,idx] = sort([images.datenum]);
images= images(idx)
 filename = 'double.gif';
for i=1:50
    a=strsplit(images(i).name,'.');
    a = a{1};
        a=strsplit(a,'_');
        

        img = imread([images(i).folder , '\',images(i).name]);
        img = imresize(img,0.7);
       imshow(uint8(img))
       set(gcf,'color','w');

        title(['Iteration ', a{3}])
        
		gif_generator(h,filename,i,DelayTime)
         
end





