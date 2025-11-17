clear all; clc; close all;

%% Initialize Data Sets and Preallocating data types
Folder = '../../../../G2';
str2="/";
all_files = dir(Folder);
d = dir([Folder, '/*.bin']);
n = length(d(not([d.isdir])));

% Putting the directory in order
d_sort = datetime({d.date}', 'Format', 'dd-MMM-uuuu HH:mm:ss');
[~, idx] = sort(d_sort);
d = d(idx);

%% Initialize the Reference Value
% Loading latitude and longitude from RINEX Laboratory Satellite Location
rec_dms = [40 00 35.83509 ; -105 14 37.90415];

% Converting to Degrees
rec_pos = dms2degrees(rec_dms);

% Adding Altitude so position is a 3x1
rec_pos = [rec_pos; 1614.541];
[rec_X, rec_Y, rec_Z] = geodetic2ecef(wgs84Ellipsoid('meter'), rec_pos(1), rec_pos(2), rec_pos(3));

% Create a array that will hold the output code corresponding to the data
% set input (n)
Testing_Results = zeros(n, 9);
% Column 1  - Index of File
% Column 2  - Category Flag [1, 2, 3, or 4]
% Column 3  - Number of PRNs acquired
% Column 4  - Number of PRNs used in Navigation Solution
% Column 5  - Mean Precision of Navigation Solution (JS)
% Column 6  - Standard Deviation Precision of Navigation Solution (JS)
% Column 7  - Standard Deviation Precision of Navigation Solution (DMA)
% Column 8  - Mean Accuracy of Navigation Error (m)
% Column 9  - Run Time (s) of init per data file

%% Begin processing Data Sets
for i = 1:n
    % Try running init process for data set, n
    fprintf("\n \n ========== %d ========== \n", i)
    try
    close all    
    beforeTime = datetime("now");               % Start Time
    init_Aut(append(Folder,str2,d(i).name))
    endTime = datetime("now");                  % End Time
    timeDiff = seconds(endTime - beforeTime);   % Time Difference in Seconds

    % Try to catch any errors during the init process
    catch Error
        Testing_Results(i, 1) =i;
        % Set Output code to 1 if there is a error
        Testing_Results(i, 2) = 1;
    end    
    load("acqResults.mat")
    load("trkResults.mat")
    load('navResults.mat')

    if Testing_Results(i, 2) == 1
        % If there is a error, do nothing
        Testing_Results(i, 3) = NaN;
        Testing_Results(i, 4) = NaN;
        Testing_Results(i, 5) = NaN;
        Testing_Results(i, 6) = NaN;
        Testing_Results(i, 7) = NaN;
        Testing_Results(i, 8) = NaN;
        Testing_Results(i, 9) = timeDiff;

    elseif isempty(navResults) || isnan(mean(sqrt(navResults.X.^2+navResults.Y.^2+navResults.Z.^2)))
        % Check if navigation solution is empty or NAN
        % output code = 2
        Testing_Results(i, 1) = i;
        Testing_Results(i, 2) = 2;

        % Counting the number of acquired PRNs
        count = 0;
        for j = 1:numel(acqResults.carrFreq)
            % Checks if the acquired carrFreq is zero
            if nnz(acqResults.carrFreq(j))
                count = count + 1;
            end
        end

        Testing_Results(i, 3) = count;
        Testing_Results(i, 4) = NaN;
        Testing_Results(i, 5) = NaN;
        Testing_Results(i, 6) = NaN;
        Testing_Results(i, 7) = NaN;
        Testing_Results(i, 8) = NaN;
        Testing_Results(i, 9) = timeDiff;

    elseif sqrt((mean(navResults.X) - rec_X)^2 + (mean(navResults.Y) - rec_Y)^2 + (mean(navResults.Z) - rec_Z)^2) > 25
        % If position solution - reference is greater than 25 units apart,
        % output flag = 3
        Testing_Results(i, 1) = i;
        Testing_Results(i, 2) = 3;

        % Counting the number of acquired PRNs
        count = 0;
        for j = 1:numel(acqResults.carrFreq)
            % Checks if the acquired carrFreq is zero
            if nnz(acqResults.carrFreq(j))
                count = count + 1;
            end
        end

        Testing_Results(i, 3) = count;
        Testing_Results(i, 4) = size(navResults.PRN, 1);
        Testing_Results(i, 5) = mean(sqrt((mean(navResults.X) - navResults.X).^2 + (mean(navResults.Y) - navResults.Y).^2 + (mean(navResults.Z) - navResults.Z).^2));
        Testing_Results(i, 6) = std(sqrt((mean(navResults.X) - navResults.X).^2 + (mean(navResults.Y) - navResults.Y).^2 + (mean(navResults.Z) - navResults.Z).^2));
        Testing_Results(i, 7) = mean([std(navResults.X), std(navResults.Y), std(navResults.Z)]);
        Testing_Results(i, 8) = sqrt((mean(navResults.X) - rec_X)^2 + (mean(navResults.Y) - rec_Y)^2 + (mean(navResults.Z) - rec_Z)^2);
        Testing_Results(i, 9) = timeDiff;

    elseif sqrt((mean(navResults.X) - rec_X)^2 + (mean(navResults.Y) - rec_Y)^2 + (mean(navResults.Z) - rec_Z)^2) <= 25
        % If position solution - reference is less than or equal to 25 units apart,
        % output flag = 4
        Testing_Results(i, 1) = i;
        Testing_Results(i, 2) = 4;
        
        % Counting the number of acquired PRNs
        count = 0;
        for j = 1:numel(acqResults.carrFreq)
            % Checks if the acquired carrFreq is zero
            if nnz(acqResults.carrFreq(j))
                count = count + 1;
            end
        end

        Testing_Results(i, 3) = count;
        Testing_Results(i, 4) = size(navResults.PRN, 1);
        Testing_Results(i, 5) = mean(sqrt((mean(navResults.X) - navResults.X).^2 + (mean(navResults.Y) - navResults.Y).^2 + (mean(navResults.Z) - navResults.Z).^2));
        Testing_Results(i, 6) = std(sqrt((mean(navResults.X) - navResults.X).^2 + (mean(navResults.Y) - navResults.Y).^2 + (mean(navResults.Z) - navResults.Z).^2));
        Testing_Results(i, 7) = mean([std(navResults.X), std(navResults.Y), std(navResults.Z)]);
        Testing_Results(i, 8) = sqrt((mean(navResults.X) - rec_X)^2 + (mean(navResults.Y) - rec_Y)^2 + (mean(navResults.Z) - rec_Z)^2);
        Testing_Results(i, 9) = timeDiff;
    end

    fprintf("Output Flag %d \n", Testing_Results(i, 2))
    fprintf("Data File Processing is over elapsed time   %7.2f  seconds\n", timeDiff)

end

%% Post Processing 
close all;

% Counting the Types of Categories in Column 2
edges = unique(Testing_Results(:, 2));
counts = histc(Testing_Results(:, 2), edges);

% Finding the Best, Worst, and Mean precision Test File in Column 7
[minPre, minPreFile] = min(Testing_Results(:, 7), [], 'omitNan');
[maxPre, maxPreFile] = max(Testing_Results(:, 7), [], 'omitNan');
meanPre = mean(Testing_Results(:, 7), 'omitNan');

% Finding the Best, Worst, and Mean Accuracy Test File in Column 8
[minAcc, minAccFile] = min(Testing_Results(:, 8), [], 'omitNan');
[maxAcc, maxAccFile] = max(Testing_Results(:, 8), [], 'omitNan');
meanAcc = mean(Testing_Results(:, 8), 'omitNan');

% Finding the Faster, Slowest, and Mean Timing Test File in Column 9
[minTime, minTimeFile] = min(Testing_Results(:, 9), [], 'omitNan');
[maxTime, maxTimeFile] = max(Testing_Results(:, 9), [], 'omitNan');
meanTime = mean(Testing_Results(:, 9), 'omitNan');

%% PRINTOUT
fprintf("\n===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====\n")
% Category Printout
for i = 1:length(edges)
    fprintf("     Category %d:    %d    entries \n", edges(i), counts(i));
end

% Precision Printout
fprintf("File  #  %i  has the smallest navigation precision:   %7.2f   \n", minPreFile, minPre)
fprintf("File  #  %i  has the  biggest navigation precision:   %7.2f   \n", maxPreFile, maxPre)
fprintf("Mean of the Navigation precision:                     %7.2f   \n\n", meanPre)

% Accuracy Printout
fprintf("File  #  %i  has the smallest navigation error:   %7.2f   meters\n", minAccFile, minAcc)
fprintf("File  #  %i  has the  biggest navigation error:   %7.2f   meters\n", maxAccFile, maxAcc)
fprintf("Mean of the Navigation error:                     %7.2f   meters\n\n", meanAcc)

% Timing Printout
fprintf("File  #  %i  ran the faster:       %7.2f   s\n", minTimeFile, minTime)
fprintf("File  #  %i  ran the slowest:      %7.2f   s\n", maxTimeFile, maxTime)
fprintf("Mean File Runtime:                 %7.2f   s\n", meanTime)
fprintf("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====\n")

save("Testing_Results_GAL_E5A.mat");

