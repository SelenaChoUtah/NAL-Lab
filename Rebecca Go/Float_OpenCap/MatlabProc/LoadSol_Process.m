%Asymmetry pipeline%

%% 
addpath(genpath('C:\Users\becky\Box\Turning Study\Float_OpenCap')); 
addpath(genpath('C:\Users\becky\Box\Turning Study\Data')); 

% Folder with Loadsol data
parentdir = 'C:\Users\becky\Box\Turning Study\Data';

% get list of subject folders
PDList = dir(parentdir);
subjectFolders = PDList(~ismember({PDList.name},{'.','..'})); %skip first 2 rows

i = 1; %for each subject folder

LoadsolFolder = dir(fullfile(parentdir, subjectFolders(i).name));    
LoadsolFolder = LoadsolFolder(contains({LoadsolFolder.name},{'LoadSol_Data_'})); %skip first 2 rows

%Access to the raw marker data
Trial = LoadsolFolder(~ismember({LoadsolFolder.name},{'.','..'})); %skip first 2 rows

% Can make a loop that goes through the different trial data 
j = 1; 

%data = import(Trial(j).name); 