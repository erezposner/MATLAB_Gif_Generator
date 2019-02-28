function  gif_generator(h,filename,index,DelayTime)
if nargin<4
    DelayTime = 0.1;
end

frame = getframe(h);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
% Write to the GIF File
if index == 1
    imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
else
    imwrite(imind,cm,filename,'gif','DelayTime',DelayTime,'WriteMode','append');
end
