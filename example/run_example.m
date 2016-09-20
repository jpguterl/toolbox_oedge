%%in general, type 'help name_of_function' for details about input of the function name_of_function 

%% setup name of the case and folder where the results are stored
casename='testjerome';
folder='results';
%% load the data from divimp output file 
datpol=read_pol_bgp(casename,folder);
datvol=read_vol_bgp(casename,folder);
dattar=read_tar_bgp(casename,folder);


%%check which data are available (e.g. for volume)
list_field(datvol)

%% here is the background plasma Te 
%usage: plot_bgplasma(datvol,field,logscale=0(default)|1,[limcolorlow limcolorhigh](optional)
plot_bgplasma(datvol,'Te',1);

% here is the background plasma vpara and Epara 
plot_bgplasma(datvol,['vpara';'Epara'],0);
% here is the background plasma vpara with adjusted color scale 
plot_bgplasma(datvol,['vpara'],0,[-4e4 4e4]);
%% you can display the separatrix to see where the flow reversal occurs
display_separatrix(datvol)
%% you can display the mesh and ring structure of oedge one previous or new figure
% let display the mesh
display_mesh(datpol,1);
% you can read the ring number directly on the plot with the data cursor
% you can plot only certain rings or certain region 
%usage: display_ring(dat_vol,[iring](optional),whichregion=0(all)|1(SOL)|2(PFR)|3(CORE),newfig=0|1)
display_ring(datvol,[],0,0)

% let plot data long the field line now, e.g. Te on ring 36 and 37 on
% seperate plots
%usage: plot_bgplasma_line(dat_vol,field,[irings],group=0,range)
%group=0 new figure for each graph
%     =1 figure containing 12 subplots
%      =2 superposition on one figure;
plot_bgplasma_line(datvol,'Te',[36 37],0);
% let know compares Te of rings 36 and 37 on the same plot but with 0m<s<30m
plot_bgplasma_line(datvol,'Te',[36 37],2,[0 30]);
% let plot info at the target 
%... in development
