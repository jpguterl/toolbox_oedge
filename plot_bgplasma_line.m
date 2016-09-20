function plot_bgplasma_line(dat_vol,field,irings,group,range)
%plot_bgplasma_line(dat_vol,field,[irings],group=0,range)
%group=0 new figure for each graph
%     =1 figure containing 12 subplots
%      =2 superposition on one figure;
%by J.Guterl Sept 2016
maxplot=12;
if nargin<2
    error('missing input arguments');
end
if nargin<3
    irings=[1:dat_vol.Nring];
end
Nring=dat_vol.Nring;
if max(irings)>Nring || min(irings)<1
    error('Ring number are out of bound');
end
if nargin<4
    group=0;
end
if nargin<5
    range(1)=0;range(2)=max(max(dat_vol.s_(:,:)));
end
Nplot=length(irings);
eval(['data=dat_vol.' field '_;']);
if group~=0
    figure;
end
iplot=1;


for ir=irings
if group==0
    figure;
end
idx=1:dat_vol.Ncell(ir);
if iplot>12
    iplot=1;
    figure;
end
if group==1
subplot(4,3,iplot)
end
plot(dat_vol.s_(ir,idx),data(ir,idx),'DisplayName',['ir=' num2str(ir)]);hold on;
xlabel('s[m]');ylabel(field);legend('-DynamicLegend','Location','NorthEast');
if nargin>4
    xlim([range(1) range(2)]);
end
if iplot==1
    title([dat_vol.casename, ', ir=' num2str(ir)]);
else
    title(['ir=' num2str(ir)]);
end
if group==1
iplot=iplot+1;
end
end


end
