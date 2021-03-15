
clear all
close all
% Select Imscroll (.mat) file with Cy3 traces
uiopen


% The number of trajectories in the file
ntrajectories = aoifits.aoiinfo2(end,6);


% The number of frames in the timeseries
nframes=aoifits.data(end,2);

dataexport=NaN(nframes,ntrajectories*2);

y=[0:ntrajectories];

for x=1:ntrajectories

ts = aoifits.data(x:ntrajectories:end,:);

dataexport(:,x+y(x))= ts(:,8);

end

clear aoifits ntrajectories ts x y


% % Select Imscroll (.mat) file with corresponding Cy5 traces
uiopen


% The number of trajectories in the file
ntrajectories = aoifits.aoiinfo2(end,6);


% The number of frames in the timeseries
nframes=aoifits.data(end,2);

% dataexport=NaN(nframes,ntrajectories*2);

y=[1:ntrajectories];

for x=1:ntrajectories

ts = aoifits.data(x:ntrajectories:end,:);

dataexport(:,x+y(x))= ts(:,8);

end

clear aoifits ts x y

% Write file as tab seperated output 
writematrix(dataexport,'Cy3-Cy5 traces in vbFRET format (video #6).txt','Delimiter','tab')

counter = 0;
for x=1:2:ntrajectories*2


% Plot intensity vs time
    figure
    plot(1:nframes,dataexport(:,x),'g','LineWidth',2.0); hold
    plot(1:nframes,dataexport(:,x+1),'r','LineWidth',2.0);
    plot(1:nframes,sum(dataexport(:,x:x+1),2),'k','LineWidth',2.0);
    counter = counter+1;
    title(['AOI# ' num2str(counter)]) 
    hold off
    w = waitforbuttonpress;
   close
end

