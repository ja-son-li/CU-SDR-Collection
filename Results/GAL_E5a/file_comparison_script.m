clear
clc

% ---

e5a_17 = load('file_17_TestResults.mat');
e5a_17 = e5a_17.eph;

e5a_18 = load('file_18_TestResults.mat');
e5a_18 = e5a_18.eph;

e5a_19 = load('file_19_TestResults.mat');
e5a_19 = e5a_19.eph;

e5a_20 = load('file_20_TestResults.mat');
e5a_20 = e5a_20.eph;

e5a_21 = load('file_21_TestResults.mat');
e5a_21 = e5a_21.eph;

e5a_22 = load('file_22_TestResults.mat');
e5a_22 = e5a_22.eph;

e5a_23 = load('file_23_TestResults.mat');
e5a_23 = e5a_23.eph;

e5a_24 = load('file_24_TestResults.mat');
e5a_24 = e5a_24.eph;

e5a_25 = load('file_25_TestResults.mat');
e5a_25 = e5a_25.eph;

e5a_26 = load('file_26_TestResults.mat');
e5a_26 = e5a_26.eph;

% ----

prn = 4;
prn4_comp = e5a_17(prn);
prn4_comp(2) = e5a_18(prn);
prn4_comp(3) = e5a_19(prn);
prn4_comp(4) = e5a_20(prn);
prn4_comp(5) = e5a_21(prn);
prn4_comp(6) = e5a_22(prn);
prn4_comp(7) = e5a_23(prn);
prn4_comp(8) = e5a_24(prn);
prn4_comp(9) = e5a_25(prn);

prn = 6;
prn6_comp = e5a_17(prn);
prn6_comp(2) = e5a_18(prn);
prn6_comp(3) = e5a_19(prn);
prn6_comp(4) = e5a_20(prn);
prn6_comp(5) = e5a_21(prn);
prn6_comp(6) = e5a_22(prn);
prn6_comp(7) = e5a_23(prn);
prn6_comp(8) = e5a_24(prn);
prn6_comp(9) = e5a_25(prn);
prn6_comp(10) = e5a_26(prn);

prn = 9;
prn9_comp = e5a_17(prn);
prn9_comp(2) = e5a_18(prn);
prn9_comp(3) = e5a_19(prn);
prn9_comp(4) = e5a_20(prn);
prn9_comp(5) = e5a_21(prn);
prn9_comp(6) = e5a_22(prn);
prn9_comp(7) = e5a_23(prn);
prn9_comp(8) = e5a_24(prn);
prn9_comp(9) = e5a_25(prn);
prn9_comp(10) = e5a_26(prn);

prn = 10;
prn10_comp = e5a_17(prn);
prn10_comp(2) = e5a_18(prn);
prn10_comp(3) = e5a_19(prn);
prn10_comp(4) = e5a_20(prn);
prn10_comp(5) = e5a_21(prn);
prn10_comp(6) = e5a_22(prn);
prn10_comp(7) = e5a_23(prn);
prn10_comp(8) = e5a_24(prn);
prn10_comp(9) = e5a_25(prn);
prn10_comp(10) = e5a_26(prn);

prn = 11;
prn11_comp = e5a_17(prn);
prn11_comp(2) = e5a_18(prn);
prn11_comp(3) = e5a_19(prn);
prn11_comp(4) = e5a_20(prn);
prn11_comp(5) = e5a_21(prn);
prn11_comp(6) = e5a_22(prn);
prn11_comp(7) = e5a_23(prn);
prn11_comp(8) = e5a_24(prn);
prn11_comp(9) = e5a_25(prn);
prn11_comp(10) = e5a_26(prn);

prn = 12;
prn12_comp = e5a_17(prn);
prn12_comp(2) = e5a_18(prn);
prn12_comp(3) = e5a_19(prn);
prn12_comp(4) = e5a_20(prn);
prn12_comp(5) = e5a_21(prn);
prn12_comp(6) = e5a_22(prn);
prn12_comp(7) = e5a_23(prn);
prn12_comp(8) = e5a_24(prn);
prn12_comp(9) = e5a_25(prn);
prn12_comp(10) = e5a_26(prn);

prn = 19;
prn19_comp = e5a_17(prn);
prn19_comp(2) = e5a_18(prn);
prn19_comp(3) = e5a_19(prn);
prn19_comp(4) = e5a_20(prn);
prn19_comp(5) = e5a_21(prn);
prn19_comp(6) = e5a_22(prn);
prn19_comp(7) = e5a_23(prn);
prn19_comp(8) = e5a_24(prn);
prn19_comp(9) = e5a_25(prn);
prn19_comp(10) = e5a_26(prn);

prn = 21;
prn21_comp = e5a_17(prn);
prn21_comp(2) = e5a_18(prn);
prn21_comp(3) = e5a_19(prn);
prn21_comp(4) = e5a_20(prn);
prn21_comp(5) = e5a_21(prn);
prn21_comp(6) = e5a_22(prn);
prn21_comp(7) = e5a_23(prn);
prn21_comp(8) = e5a_24(prn);
prn21_comp(9) = e5a_25(prn);
prn21_comp(10) = e5a_26(prn);

prn = 23;
prn23_comp = e5a_17(prn);
prn23_comp(2) = e5a_18(prn);
prn23_comp(3) = e5a_19(prn);
prn23_comp(4) = e5a_20(prn);
prn23_comp(5) = e5a_21(prn);
prn23_comp(6) = e5a_22(prn);
prn23_comp(7) = e5a_23(prn);
prn23_comp(8) = e5a_24(prn);
prn23_comp(9) = e5a_25(prn);
prn23_comp(10) = e5a_26(prn);

% prn = 36;
% prn36_comp = e5a_17(prn);
% prn36_comp(2) = e5a_18(prn);
%  prn36_comp(3) = e5a_19(prn);
% prn36_comp(4) = e5a_20(prn);
% prn36_comp(5) = e5a_21(prn);
% prn36_comp(6) = e5a_22(prn);
% prn36_comp(7) = e5a_23(prn);
% prn36_comp(8) = e5a_24(prn);
% prn36_comp(9) = e5a_25(prn);
% prn36_comp(10) = e5a_26(prn);

IDs = 17:26;
for k = 1:10
    prn4_comp(k).fileID = IDs(k);
    prn6_comp(k).fileID = IDs(k);
    prn9_comp(k).fileID = IDs(k);
    prn10_comp(k).fileID = IDs(k);
    prn11_comp(k).fileID = IDs(k);
    prn12_comp(k).fileID = IDs(k);
    prn19_comp(k).fileID = IDs(k);
    prn21_comp(k).fileID = IDs(k);
    prn23_comp(k).fileID = IDs(k);
    prn36_comp(k).fileID = IDs(k);
end
