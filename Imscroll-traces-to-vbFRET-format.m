
% Open Cy3 traces
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

clear aoifits nframes ntrajectories ts x y


% Open Cy5 traces
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

clear aoifits nframes ntrajectories ts x y

% Write file as tab seperated output 
writematrix(dataexport,'Cy3-Cy5 traces in vbFRET format (video #6).txt','Delimiter','tab')