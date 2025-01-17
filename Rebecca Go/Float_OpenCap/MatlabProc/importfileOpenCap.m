function neutral = importfileOpenCap(filename, dataLines)
%IMPORTFILE Import data from a text file
%  NEUTRAL = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  NEUTRAL = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  neutral = importfile("C:\Users\u6052635\Box\CeciliaMonoli\Float_OpenCap\OpenCapData_5605bc63-3da2-49b2-9a72-5b0b2ffbcf2a\MarkerData\neutral.trc", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 17-Jul-2024 12:15:02

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [7, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 191);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["Frame", "Time", "NeckX", "NeckY", "NeckZ", "RShoulderX", "RShoulderY", "RShoulderZ", "RSElbowX", "RSElbowY", "RSElbowZ", "RWristX", "RWristY", "RWristZ", "LShoulderX", "LShoulderY", "LShoulderZ", "LElbowX", "LElbowY", "LElbowZ", "LWristX", "LWristY", "LWristZ", "midHipX", "midHipY", "midHipZ", "RHipX", "RHipY", "RHipZ", "RKneeX", "RKneeY", "RKneeZ", "RAnkleX", "RAnkleY", "RAnkleZ", "LHipX", "LHipY", "LHipZ", "LKneeX", "LKneeY", "LKneeZ", "LAnkleX", "LAnkleY", "LAnkleZ", "LBigToeX", "LBigToeY", "LBigToeZ", "LSmallToeX", "LSmallToeY", "LSmallToeZ", "LHeelX", "LHeelY", "LHeelZ", "RBigToeX", "RBigToeY", "RBigToeZ", "RSmallToeX", "RSmallToeY", "RSmallToeZ", "RHeelX", "RHeelY", "RHeelZ", "rASIS_studyX", "rASIS_studyY", "rASIS_studyZ", "LASIS_studyX", "LASIS_studyY", "LASIS_studyZ", "rPSIS_studyX", "rPSIS_studyY", "rPSIS_studyZ", "LPSIS_studyX", "LPSIS_studyY", "LPSIS_studyZ", "r_knee_studyX", "r_knee_studyY", "r_knee_studyZ", "r_mknee_studyX", "r_mknee_studyY", "r_mknee_studyZ", "r_ankle_studyX", "r_ankle_studyY", "r_ankle_studyZ", "r_mankle_studyX", "r_mankle_studyY", "r_mankle_studyZ", "r_toe_studyX", "r_toe_studyY", "r_toe_studyZ", "r_5meta_studyX", "r_5meta_studyY", "r_5meta_studyZ", "r_calc_studyX", "r_calc_studyY", "r_calc_studyZ", "L_knee_studyX", "L_knee_studyY", "L_knee_studyZ", "L_mknee_studyX", "L_mknee_studyY", "L_mknee_studyZ", "L_ankle_studyX", "L_ankle_studyY", "L_ankle_studyZ", "L_mankle_studyX", "L_mankle_studyY", "L_mankle_studyZ", "L_toe_studyX", "L_toe_studyY", "L_toe_studyZ", "L_calc_studyX", "L_calc_studyY", "L_calc_studyZ", "L_5meta_studyX", "L_5meta_studyY", "L_5meta_studyZ", "r_shoulder_studyX", "r_shoulder_studyY", "r_shoulder_studyZ", "L_shoulder_studyX", "L_shoulder_studyY", "L_shoulder_studyZ", "C7_studyX", "C7_studyY", "C7_studyZ", "r_thigh1_studyX", "r_thigh1_studyY", "r_thigh1_studyZ", "r_thigh2_studyX", "r_thigh2_studyY", "r_thigh2_studyZ", "r_thigh3_studyX", "r_thigh3_studyY", "r_thigh3_studyZ", "L_thigh1_studyX", "L_thigh1_studyY", "L_thigh1_studyZ", "VarName138", "L_thigh2_studyY", "L_thigh2_studyZ", "L_thigh3_studyX", "L_thigh3_studyY", "L_thigh3_studyZ", "r_sh1_studyX", "r_sh1_studyY", "r_sh1_studyZ", "r_sh2_studyX", "r_sh2_studyY", "r_sh2_studyZ", "r_sh3_studyX", "r_sh3_studyY", "r_sh3_studyZ", "L_sh1_studyX", "L_sh1_studyY", "L_sh1_studyZ", "L_sh2_studyX", "L_sh2_studyY", "L_sh2_studyZ", "L_sh3_studyX", "L_sh3_studyY", "L_sh3_studyZ", "RHJC_studyX", "RHJC_studyY", "RHJC_studyZ", "LHJC_studyX", "LHJC_studyY", "LHJC_studyZ", "r_lelbow_studyX", "r_lelbow_studyY", "r_lelbow_studyZ", "r_melbow_studyX", "r_melbow_studyY", "r_melbow_studyZ", "r_lwrist_studyX", "r_lwrist_studyY", "r_lwrist_studyZ", "r_mwrist_studyX", "r_mwrist_studyY", "r_mwrist_studyZ", "L_lelbow_studyX", "L_lelbow_studyY", "L_lelbow_studyZ", "L_melbow_studyX", "L_melbow_studyY", "L_melbow_studyZ", "L_lwrist_studyX", "L_lwrist_studyY", "L_lwrist_studyZ", "L_mwrist_studyX", "L_mwrist_studyY", "L_mwrist_studyZ"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
neutral = readtable(filename, opts);

end