function init_Aut(varargin)
format ('compact');
format ('long', 'g');

%--- Include folders with functions ---------------------------------------
addpath include             % The software receiver functions
addpath Common              % Common functions between different SDR receivers
%addpath geoFunctions        % Position calculation related functions
%addpath generatRinexFiles   % Rinex generation related functions
%addpath utils
%addpath TrackingFun         % Tracking Related Functions

%% Initialize constants, settings =========================================
settings = initSettings();
settings.fileName = string(varargin);

%% Generate plot of raw data and ask if ready to start processing =========
fprintf('Probing data (%s)...\n', settings.fileName)
probeData(settings);

postProcessing

end