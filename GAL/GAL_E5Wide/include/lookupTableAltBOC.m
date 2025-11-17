function altbocSignal = lookupTableAltBOC(E5aI, E5bI, E5aQ, E5bQ, t)

kTable = [ ...
    5 4 4 3 6 3 1 2 6 5 7 2 7 8 8 1; ... % iTs = 0
    5 4 8 3 2 3 1 2 6 5 7 6 7 4 8 1; ... % 
    1 4 8 7 2 3 1 2 6 5 7 6 3 4 8 5; ... %
    1 8 8 7 2 3 1 6 2 5 7 6 3 4 4 5; ... %
    1 8 8 7 2 7 5 6 2 1 3 6 3 4 4 5; ... %
    1 8 4 7 6 7 5 6 2 1 3 2 3 8 4 5; ... %
    5 8 4 3 6 7 5 6 2 1 3 2 7 8 4 1; ... % 
    5 4 4 3 6 7 5 2 6 1 3 2 7 8 8 1]; % iTs = 7

% Map quadruples to indices in kTable
quadruples = [-1 -1 -1 -1; 
            -1 -1 -1 1; 
            -1 -1 1 -1; 
            -1 -1 1 1;
            -1 1 -1 -1;
            -1 1 -1 1; 
            -1 1 1 -1; 
            -1 1 1 1;
             1 -1 -1 -1; 
             1 -1 -1 1; 
             1 -1 1 -1; 
             1 -1 1 1;
             1 1 -1 -1;  
             1 1 -1 1; 
             1 1 1 -1;  
             1 1 1 1];

% Loop over samples
N = length(E5aI);

altbocSignal = zeros(size(t));

% 
TsE5 = 1/15.345e6; % side-band subcarrier 

for n = 1:N
    % Find subcarrier index iTs
    iTs = floor(8/TsE5 * mod(t(n), TsE5));
    
    % Get current quadruple
    q = [E5aI(n), E5bI(n), E5aQ(n), E5bQ(n)];
    
    % Find index of this quadruple (1-16)
    idx = all(quadruples == q, 2);
    
    if all(idx == 0)
        altbocSignal(n) = 0;
    else
        % Lookup k
        k = kTable(iTs+1, idx);  % MATLAB indexing
        
        % Map k to phase
        phase = k * pi/4;   % k = 1..8 maps to 0..7*pi/4
        
        % Construct complex sample (unit amplitude)
        altbocSignal(n) = exp(1j * phase);
    end
end


end