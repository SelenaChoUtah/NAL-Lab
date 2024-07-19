%% Working with Data in MATLAB

%  In this demonstration, you will learn how to apply the knowledge of data
%  measurement and instrumentation to data that has already been collected.

%% Demonstration 1: Determining motion during standing
%%  Step 1: Explore the data.

% Write a line to load in the file (hint: load(' '))


%     How many sensors collected data?
%     What was the sampling rate?
%     What types of data did each sensor collect?


%% Step 2: Plot the angular velocity in the sagittal plane at the lumbar sensor (the y-direction)

%     How long is the trial? What does this tell you about using IMU data
%     from the Opals, and what data reflects the task?

%     When was the 'push'?
%     Mark the time of the push with a vertical dashed line (hint: use
%     'vline')


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



%   What do you notice about the angular displacement? Is this real? What
%   type of error are we seeing?


%   Try to remove this error. What strategies did you use?


%   Can we be confident you have correctly removed the error? What other sources can we use?



%% Step 4: Calculate inclination angle
%   Create a function to calculate the inclination angle in the sagittal plane from the
%   accelerometer signal Hint: Use the x and z axes. You can open a new
%   file to make a function. 




%   What is the mean inclinometer angle? Why is it not 0? Plot the
%   inclinometer relative to the starting position (mean of the 3 second
%   calibration pose)




%   Were any of your gryo-based angular displacements correct? What error
%   did they remove? What error is still left?


%% Step 5: Plot the error and detrend the angular displacement estimate from the gyro

% Plot the inclinometer angle and the gyro-based angle on one subplot;
% Below it, plot the difference using a bar plot




%   The inclinometer data is pretty noisy, try smoothing it with a moving average
%   and repeating the step above. Try a sliding window of ~0.1 s



%   Fit a line to the error



%   Remove the trendline from the angular displacement of the gyro. 
%   Hint: detrend() or potentially remove the mean of the signal
%   Plot your options using subplots to visually compare the differences



%   What can you do to improve these methods? Which signal do you trust to
%   give true angular displacement?







