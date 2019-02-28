clc;clear all; close all
x = 1:20';
y = rand(size(x,2),1);
n=1;
DelayTime=0.2;
h = figure; hold on; axis tight manual % this ensures that getframe() returns a consistent size

xlim([min(x) max(x)]), ylim([min(y) max(y)])

cm = jet(size(x,2));
filename = 'out.gif';
for i=1:size(x,2)
        plot(x(1:i),y(1:i),'Color',cm(i,:))
		gif_generator(h,filename,i,DelayTime)
end





