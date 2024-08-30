%% Working with Data in MATLAB
%  In this demonstration, you will learn how to apply the knowledge of data
%  measurement and instrumentation to data that has already been collected.

%% Demonstration 1: Determining motion during standing
load('swayData.mat')
garmin = readtable("Data\Garmin_06_27_2023.csv");
%%  Step 1: Explore the data.

% Write a line to load in the file (hint: load(' '))
% link CSV file in Box to this code - from what I learned I think we don't
% want to just have files stored in GitHub so we should try to import
% directly from box
%url = 'https://uofu.box.com/s/6su2c1f5vgzk1j0chxokqqd77kuo7fnd'; % I think I might not be able to open this because of how box is, do you know if permissions can be changed?
%filename = 'Polar_Box_Data.csv'; % Looking at the further parts, I think I might have the wrong CSV file imported, I'll talk to you about this
%websave(filename, url);

% reading the CSV file
%data = readtable(filename);
% remove all empty parts of the CSV file to make the file easier to work
% with
%data = data(~all(imissing(data), 2), :); %remove empty rows
%data = data(: ~all(imissing(data), 1)); %remove empty rows
%analysis_table = data;
% the goal is to have a data table to analyze that is not as big so it can
% be worked with

%     How many sensors collected data?
%     What was the sampling rate?
%     What types of data did each sensor collect?


%% Step 2: Plot the angular velocity in the sagittal plane at the lumbar sensor (the y-direction)

%   How long is the trial? What does this tell you about using IMU data
%   from the Opals, and what data reflects the task?
% This is where I might need some guidance - I assumed that the data for
% the lumbar sensor was in the y-axis-direction and used the column named
% 'AngularVelocity_Y'. I wasn't sure what the time column was so, I sent
% time= = analysis_table.Time; so it plots angular_velocity_y =
% analysis_table.AngularVelocity_Y;

time= = analysis_table.Time; % make sure the column name is correct

% plot the angular velocity figure

plot(time, angular_velocity_y);
xlabel('Time (s)');
ylabel('Angular Velocity (deg/s)');
title('Angular Velocity in the Sagittal Plane at the Lumbar Sensor (Y-Direction)');

%     When was the 'push'?
%       This I think will have to be manually determined. Maybe it's
%       partially due to the fact that I don't know what I'm doing, but I'm
%       not sure we'll be able to program this.
%     Mark the time of the push with a vertical dashed line (hint: use
%     'vline')

% Marking the time of the push
push_time = 'time we figure out...';
hold on;
xline(push_time, '--r', 'Push') % adds a line to my graph where push time occurred

%    Does this time look right? Why or why not?
%    Can you improve the detection of the push? How? Show how if so,
%    plotting the new start in blue

%   What other approaches could you use? Try to implement them now. Are any
%   more reliable with less guess work?


%% Step 3: Plot the angular displacement over time.
%   Plot the angular displacement in degrees on the same figure. Use yyaxis to assign
%   the right y axis as the active axis. Hint: use cumtrapz to perform
%   trapezoidal integration. <- Google matlab cumtrapz to figure out how to
%   use the function. I do a crap ton of googling on how to functions 

% Calculate the angular displacement using cumulative trapezoidal
% integration (I did google this, so it's giving some huge issues still,
% this part DOES NOT WORK YET
angular_displacement = cumtrapz(time, angular_velocity_y);

% Plot the angular displacement
yyaxis right;
plot(time, angular_displacement, 'b');
ylabel('Angular Displacement (degrees)');
legend('Agnular Velocity', 'Angular Displacement');


%   What do you notice about the angular displacement? Is this real? What
%   type of error are we seeing?
%   Try to remove this error. What strategies did you use?
%   Can we be confident you have correctly removed the error? What other sources can we use?



%% Step 4: Calculate inclination angle
%   Create a function to calculate the inclination angle in the sagittal plane from the
%   accelerometer signal Hint: Use the x and z axes. You can open a new
%   file to make a function. 
inclination_angle = calculate_inclination(analysis_table.Acceleration_X, analysis_table.Acceleration_Z);

% plot the inclination anlge
figure;
plot(time, inclination_angle);
xlabel('Time (s)');
ylabel('Inclination Angle (degrees');
title('Inclination Angle in the Sagittal Plane')

%   What is the mean inclinometer angle? Why is it not 0? Plot the
%   inclinometer relative to the starting position (mean of the 3 second
%   calibration pose)

%   Were any of your gryo-based angular displacements correct? What error
%   did they remove? What error is still left?


%% Step 5: Plot the error and detrend the angular displacement estimate from the gyro

% Assuming error is calculated (difference between inclination angle and gyro-based angle)
% before? This may be something we try to add in later
% possible calculation that could be used: error = inclination_angle - angular_displacement;

% Plot the inclinometer angle and the gyro-based angle on one subplot;
subplot(2,1,1);
plot(time, inclination_angle, 'g');
hold on;
plot(time, angular_displacement, 'b');
xlabel('Time (s)');
ylabel('Angle (degrees)');
legend('Inclinometer Angle', 'Gyro-based Angle');
title('Comparison of Inclinometer and Gyro Angles');

% Below it, plot the difference using a bar plot
subplot(2,1,2);
bar(time, error);
xlabel('Time (s)');
ylabel('Error (degrees)');
title('Error Between Inclinometer and Gyro-based Angles');

%   The inclinometer data is pretty noisy, try smoothing it with a moving average
%   and repeating the step above. Try a sliding window of ~0.1 s
window_size = 0.1; % time in seconds
smooth_inclination = movmean(inclination_angle, round(window_size * length(time)/time(end)));

% Plot with data that is now smooth
subplot(2,1,1);
plot(time, smooth_inclination, 'g');
hold on;
plot(time, angular_displacement, 'b');
xlabel('Time (s)');
ylabel('Angle (degrees)');
legend('Smoothed Inclinometer Angle', 'Gyro-based Angle');
title('Comparison of Smoothed Inclinomter and Gyro-based Angles');

%   Fit a line to the error
% Plotting error with smoothed inclinometer data
smooth_error = smooth_inclination - angular_displacement;
subplot(2,1,2);
bar(time, smooth_error);
xlabel('Time (s)');
ylabel('Error (degrees)');
title('Error Between Smoothed Inclinometer and Gyro-based Angles');

%   Remove the trendline from the angular displacement of the gyro. 
%   Hint: detrend() or potentially remove the mean of the signal
%   Plot your options using subplots to visually compare the differences

% Example of possible ways to detrend
detrend_displacement = detrend(angular_displacement);

% Plotting the detrended displacement figure;
plot(time, detrended_displacement);
xlabel('Time (s)');
ylabel('Detrended Angular Displacement (degrees)');
title('Detrended Angular Displacement');

% Function to calculate inclination angle
function angle = calculate_inclination(accel_x, accel_z)
    angle = atan2d(accel_z, accel_x);
end

%   What can you do to improve these methods? Which signal do you trust to
%   give true angular displacement?