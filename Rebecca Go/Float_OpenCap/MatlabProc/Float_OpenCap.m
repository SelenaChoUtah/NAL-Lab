clc
close all
clear all

%% Could create a structure to save all trials of each person in a structure?? 


%%
addpath(genpath('C:\Users\becky\Box\Turning Study\Float_OpenCap')); 
addpath(genpath('C:\Users\becky\Box\Turning Study\Data')); 

% Folder with Opencap data
parentdir = 'C:\Users\becky\Box\Turning Study\Data';

% get list of subject folders (or OpenCap trials)
PDList = dir(parentdir);
subjectFolders = PDList(~ismember({PDList.name},{'.','..'})); %skip first 2 rows
%subjectnum = subjectFolders(listdlg('PromptString',{'Select Subjects to Pull (can select multiple)',''},...
        %'SelectionMode','multiple','ListString',{subjectFolders.name}));

i = 1;
% Activate this loop for multiple subjects processing
%for i = 1:numel(subjectnum)
    %id = string(subjectnum(i).name);
OpencapFolder = dir(fullfile(parentdir, subjectFolders(i).name));    
OpencapFolder = OpencapFolder(contains({OpencapFolder.name},{'OpenCapData'})); %skip first 2 rows
%end

% Access to the raw marker data
datafolder =dir(char(fullfile(OpencapFolder.folder, OpencapFolder.name, 'MarkerData/')));
Trial = datafolder(~ismember({datafolder.name},{'.','..'})); %skip first 2 rows

% Can make a loop that goes through the different trial data 
j = 1; 
% for j = 1: height(Trial)
    % Could create a structure to save all trials of each person in a structure?? 
    % aa = Trial(j).name
    % newStr = erase(aa,'.trc')
    
    data = importfileOpenCap(Trial(j).name); 

% end

%% 3D plot Trunk and feet 

figure; 
for k = 1:25:height(data)
    x = [data.C7_studyX(k); data.r_shoulder_studyX(k); data.rPSIS_studyX(k); data.LPSIS_studyX(k); data.L_shoulder_studyX(k); data.C7_studyX(k)]; 
    y = [data.C7_studyY(k); data.r_shoulder_studyY(k); data.rPSIS_studyY(k); data.LPSIS_studyY(k); data.L_shoulder_studyY(k); data.C7_studyY(k)]; 
    z = [data.C7_studyZ(k); data.r_shoulder_studyZ(k); data.rPSIS_studyZ(k); data.LPSIS_studyZ(k); data.L_shoulder_studyZ(k); data.C7_studyZ(k)]; 

    footRx = [data.r_calc_studyX(k); data.r_5meta_studyX(k); data.r_toe_studyX(k); data.r_calc_studyX(k)];
    footRy = [data.r_calc_studyY(k); data.r_5meta_studyY(k); data.r_toe_studyY(k); data.r_calc_studyY(k)];
    footRz = [data.r_calc_studyZ(k); data.r_5meta_studyZ(k); data.r_toe_studyZ(k); data.r_calc_studyZ(k)];

    footLx = [data.L_calc_studyX(k); data.L_5meta_studyX(k); data.L_toe_studyX(k); data.L_calc_studyX(k)];
    footLy = [data.L_calc_studyY(k); data.L_5meta_studyY(k); data.L_toe_studyY(k); data.L_calc_studyY(k)];
    footLz = [data.L_calc_studyZ(k); data.L_5meta_studyZ(k); data.L_toe_studyZ(k); data.L_calc_studyZ(k)];
 
% plot(x, y, '-o');   
t = plot3(x, z, y); 
t.LineStyle = "-";
t.Color = "blue";
t.Marker = "o";

hold on; 
p = plot3(footRx, footRz, footRy); 
p.LineStyle = ":";
p.Color = "red";
p.Marker = "o";

h = plot3(footLx, footLz, footLy); 
h.LineStyle = "--";
h.Color = "black";
h.Marker = "o";

pause(0.1)

end

xlabel('x'); ylabel('z'); zlabel('y')
xlim([-2,2]); ylim([-2,2]); zlim([0,1.7])

%% CALCULATE CENTERS 
% Average of the three directions

rfootC = table((data.r_calc_studyX + data.r_5meta_studyX + data.r_toe_studyX)/3, (data.r_calc_studyY + data.r_5meta_studyY + data.r_toe_studyY)/3, (data.r_calc_studyZ + data.r_5meta_studyZ + data.r_toe_studyZ)/3, 'VariableNames',{'X', 'Y', 'Z'} ); 
lfootC = table((data.L_calc_studyX + data.L_5meta_studyX + data.L_toe_studyX)/3, (data.L_calc_studyY + data.L_5meta_studyY + data.L_toe_studyY)/3, (data.L_calc_studyZ + data.L_5meta_studyZ + data.L_toe_studyZ)/3, 'VariableNames',{'X', 'Y', 'Z'} );

Body = table((data.rASIS_studyX + data.LASIS_studyX + data.rPSIS_studyX + data.LPSIS_studyX)/4, ...
    (data.rASIS_studyY + data.LASIS_studyY + data.rPSIS_studyY + data.LPSIS_studyY)/4 , (data.rASIS_studyZ + data.LASIS_studyZ + data.rPSIS_studyZ + data.LPSIS_studyZ)/4, 'VariableNames',{'X', 'Y', 'Z'} ); 

% Plots the path/coordinates of the center of the right foot
figure; 
hold on; 
rf = plot3(rfootC.X, rfootC.Z, rfootC.Y); 
rf.Color = "black";

% Plots the path/coordinates of the center of the left foot
lf = plot3(lfootC.X, lfootC.Z, lfootC.Y); 
lf.Color = "blue";
% rf.Marker = "o";

% Plots the path/coordinates of the body center
b = plot3(Body.X, Body.Z, Body.Y); 
b.Color = "red"; 

% Labels the three axex
xlabel('x'); ylabel('z'); zlabel('y')
 
% Groups all of the x, y, and z coordinates into respective bins
x = [rfootC.X'; Body.X'; lfootC.X'];
y = [rfootC.Y'; Body.Y'; lfootC.Y'];
z = [rfootC.Z'; Body.Z'; lfootC.Z'];

% Plots the connection between the three body objects
plot3(x(:,1:50:1730), z(:,1:50:1730), y(:,1:50:1730), '-o', 'Color','g')

hold off

% end
%% Determining Continuous Angle Values

% zdistance = (z(1,:)-z(2,:));
% ydistance = (y(1,:)-y(2,:));
% proportion = zdistance(1,:) ./ ydistance(1,:);
% angle = atan(proportion(1,:));

zdistance = (z(1,:)-z(2,:));
ydistance = (y(1,:)-y(2,:));
proportion = zdistance(1,:) ./ ydistance(1,:);
angle = atan(proportion(1,:));
angle_deg = angle(1,:) .* (180/pi);
mean_100 = mean(angle_deg(1,1:100));
angle_diff = angle_deg - mean_100;
angle_diff_transpose = (angle_diff)';

figure;
plot(data.Time,angle_diff_transpose);
xlabel('Time (seconds)')
ylabel('Lean Angle (degrees)');
title('Lean Angles During Circular Walking');

% end
%% Determining Heel Strikes

% Make sure that you are using the dominant leg! This means you may have 
% to change from r_calc_studyY to L_calc_studyY 

%Finding the relevant angles using heel strike identification
vert_heel_data = data.r_calc_studyY;
inverted_data = -vert_heel_data;
figure;
plot(data.Time,inverted_data);
[peaks,time_locs] = findpeaks(inverted_data,data.Time,"MinPeakDistance",0.4,"MinPeakHeight",-0.15,"MinPeakProminence",0.1);
[ispresent, frame_locs_idx] = ismember(time_locs, data.Time);
hold on
plot(time_locs,peaks,"ro");
xlabel('Time (seconds)');
ylabel('Right Heel Marker Y-Position (meters)');
title('Inverted Right Heel Marker Movement During Circular Walking');
hold off
minima = -peaks;

figure;
plot(data.Time,data.r_calc_studyY);
hold on;
plot(time_locs, minima, 'ro', 'MarkerFaceColor', 'r'); % Mark minima with red circles
hold off;
xlabel('Time (seconds)');
ylabel('Right Heel Marker Y-Position (meters)');
title('Right Heel Marker Movement During Circular Walking');
legend('Original Signal', 'Heel Strike');

% end
%% Summary of Angles

% Identifies the angle's instance when the heel is initally struck. 
% The absolute value is established because the angle does not need
% direction. The mean and standard deviation is noted, as well as the
% number of heel strikes/steps.
max_angles = angle_diff_transpose(frame_locs_idx,:);
max_angles_abs = abs(max_angles);
mean_lean_angle = mean(max_angles_abs);
std_lean_angle = std(max_angles_abs);
steps = numel(minima);

% This figure is attempting to illustrate the instances that are used to 
% quantify the maximum lean angle in comparison with the continuous angle
angles_used_in_max_calc = angle_diff_transpose(frame_locs_idx,:);
figure;
plot(data.Time,angle_diff_transpose);
hold on
plot(time_locs, angles_used_in_max_calc, 'ro', 'MarkerFaceColor', 'r');
xlabel('Time (seconds)');
ylabel('Lean Angle (degrees)');
title('Lean Angle During Circular Walking');
hold off

% end