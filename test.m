% structdlg_test.m

% demonstrates use of structdlg.m function
% 
% default of 2000, allowed range:[30 50000].
%		S.center_frequency = { 2000 'Hz' [30 50000] }; 
% default of 43, no limits.
%		S.my_parameter     = { 43 }; 
% default of [4 12], allowed range:[1 Inf].
%		S.size_of_matrix   = { [3 2] '' [1 Inf] }; 
%		S.Weight_Matrix = [0.3 0.4; 3.4 9.1; 10 0.4];
%		S.User_name = {'' ''};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define the test structure, T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	T.StimInterval = 100;
	T.StimDuration = 200;
	T.AcqDuration = 300;
	T.SweepPeriod = T.AcqDuration + 10;
	T.StimDelay = 50;
	T.HeadstageGain = 1000;
	T.MonitorChannel = 1;
	T.MonitorGain = 1000;
	T.decifactor = 1;
	T.HPEnable = 1;
	T.HPFreq = 200;
	T.LPEnable = 1;
	T.LPFreq = 10000;
	T.nChannels = 4;
	T.InputChannel = zeros(T.nChannels, 1);
	T.OutputChannel = [17 18];
	T.TTLPulseDur = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define the limits structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	limits.ITD = [-1000 1000];
	limits.ILD = [-40 40];
	limits.Latten = [0 120];
	limits.Ratten = limits.Latten;
	limits.ABI = [0 100];
	limits.BC = [0 100];
	limits.F = [1 24000];
	limits.BW = [1 12500];
	limits.StimInterval = [0 5000];
	limits.StimDuration = [1 3000];
	limits.AcqDuration = [1 3000];
	limits.StimDelay = [0 1500];
	limits.StimRamp = [0 10];
	limits.Nreps = [1 30];
	limits.nTrials = [1 200];
	limits.Channels = [1 4];
	limits.MonitorGain = [0 100000];
	limits.HeadstageGain = [0 100000];
	limits.HPFreq = [0.001 25000];
	limits.LPFreq = [10000 50000];
	limits.TTLPulseDur = [0.1 100];
	limits.DeciFactor = [1 20];
	limits.HPEnable = [0 1];
	limits.LPEnable = [0 1];


S = StructDlg_buildInput(T, limits)

% call the structDlg with the constructed struct S and a string for the 
% dialog box title
P = StructDlg(S, 'Settings')

if isempty(P)
	disp('is empty P')
else
	P
end
