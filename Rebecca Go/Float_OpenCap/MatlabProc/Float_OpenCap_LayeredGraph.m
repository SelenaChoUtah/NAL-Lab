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


i = 1; % can either change this 
% or select the name of the Subject folder that you want to process
% changing this:
% subjectFolders(i).name = '.......'; 

% Activate this loop for multiple subjects processing
% for i = 1:height(subjectFolders)
OpencapFolder = dir(fullfile(parentdir, subjectFolders(i).name));    
OpencapFolder = OpencapFolder(contains({OpencapFolder.name},{'OpenCapData'})); %skip first 2 rows

% Access to the raw marker data
datafolder =dir(char(fullfile(OpencapFolder.folder, OpencapFolder.name, 'MarkerData/')));
Trial = datafolder(~ismember({datafolder.name},{'.','..'})); %skip first 2 rows

% Can make a loop that goes through the different trial data 
j = 3; 
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

figure; hold on; 
rf = plot3(rfootC.X, rfootC.Z, rfootC.Y); 
rf.Color = "black";

lf = plot3(lfootC.X, lfootC.Z, lfootC.Y); 
lf.Color = "blue";
% rf.Marker = "o";

b = plot3(Body.X, Body.Z, Body.Y); 
b.Color = "red"; 

xlabel('x'); ylabel('z'); zlabel('y')
 
x = [rfootC.X'; Body.X'; lfootC.X'];
y = [rfootC.Y'; Body.Y'; lfootC.Y'];
z = [rfootC.Z'; Body.Z'; lfootC.Z'];

plot3(x(:,1:50:1730), z(:,1:50:1730), y(:,1:50:1730), '-o', 'Color','g')

figure; hold off

% end
%% 

% zdistance = (z(1,:)-z(2,:));
% ydistance = (y(1,:)-y(2,:));
% proportion = zdistance(1,:) ./ ydistance(1,:);
% angle = atan(proportion(1,:));

zdistance = (z(1,:)-z(2,:));
ydistance = (y(1,:)-y(2,:));
proportion = zdistance(1,:) ./ ydistance(1,:);
angle = atan(proportion(1,:));
angle_deg = angle(1,:) .* (180/pi);

max_deg_1 = max(angle_deg_1);
max_deg_2 = max(angle_deg_2);
max_deg_3 = max(angle_deg_3);
min_deg_1 = min(angle_deg_1);
min_deg_2 = min(angle_deg_2);
min_deg_3 = min(angle_deg_3);


plot(angle_deg_1);
hold on 
yline(max_deg_1,"k");
yline(min_deg_1,"k");
plot(angle_deg_2);
yline(max_deg_2,"g");
yline(min_deg_2,"g");
plot(angle_deg_3);
yline(max_deg_3,"m");
yline(min_deg_3,"m");
ylabel('Angle (degrees)');
title('Lean Angles During Different Trials');
%legend('show');
hold off

% end