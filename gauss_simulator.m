close all;clear all;clc
s = 400;
step = [zeros(s,s/2),ones(s,s/2)];

% figure; imshow(step)
number_of_sigmas = 100;
sigma_num = 1:number_of_sigmas;
sigmas = linspace(0.1,10,number_of_sigmas);
h=figure;
DelayTime=0.2;
filename = 'blur_on_step.gif';
max_filter_size = 2*ceil(2*sigmas(number_of_sigmas))+1;
for i=1:number_of_sigmas
    
    filterSize = 2*ceil(2*sigmas(i))+1;
    kernel = gaussianKernel(sigmas(i),filterSize);
    new = conv2(step,kernel,'same');
    subplot(2,2,1) ;
    
    imshow(new); hold on;
    axis([round(s/3),round(s*2/3),round(s/3),round(s*2/3)])
    
    
    
    subplot(2,2,2) ;
    plot(1:round(s),new(round(s/2),:),'LineWidth',2); ylim([-.3,1.3]); xlim([0.4*s,0.6*s]);
    %     disp(num2str(i))
    
    subplot(2,2,[3,4]);
    
    gauss = @(x) exp(-(x.^2)/(2*sigmas(i)^2));
    a=gauss(-max_filter_size:0.1:max_filter_size);
    plot(-max_filter_size:0.1:max_filter_size,a);
    xlim([-0.8*max_filter_size,0.8*max_filter_size])
    ylim([0,1.15]);
    subplot(2,2,1) ;
    title('2D Step function','Interpreter','latex')
    subplot(2,2,2) ;
    title('1D Step Cross Section','Interpreter','latex')
    subplot(2,2,[3,4]);
    title(['1D Gaussian Kernel $\mathcal{N}(\mu=0,\sigma=',num2str(sigmas(i)),')$'],'Interpreter','latex')
    
    
    
    drawnow
    hold off;
    gif_generator(h,filename,i,DelayTime)
    
    %     pause(.01)
end