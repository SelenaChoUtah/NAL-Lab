Corinne Lab Updates

7/26
- how to get data into MetLab to work on it
    access box
is there a way to have live uploads of data or will we have re-import
data each time?
- can directly connect APIs to MatLab?
decided to import the CSV file through a link to the location in Box - I
think this will mean that every time we go to run any part of the analysis,
we will have to run this part so we have the most updated form of the CSV
file

8/2
- read through the entire analysis path to understand what needs to be done
(Selena - if you are working on adding to the analysis, will you just keep
an eye out for comments I've added for places I'm not sure that I understand
what is supposed to happen)
- answered questions 1 and 3 found in the first part of the introAnalysis sheet

8/9
- figure out how to commit to GitHub online
- determine why the GitHub Desktop is not linked to online (This issue was 
that I had made a complete copy of your repository, but so when I committed
I committed to an exact copy of your repository but it was just owned by me)

Github Notes
- don't really want large data files in GitHub
- keeps track of versions of files - if files aren't changing no need; it's
not just for sharing like box
    - if we're not trying to keep track of changing or if something is not
        changing GitHub probably doesn't need to to store it
- looks like Rebecca has the most stuff hanging around in Github (opencap data
is taking up a lot of the space
- probably don't want to store video
- gitignore can be used to prevent videos from getting added

8/14
- finally figure out how to commit progress to online so that Selena can see
it
- debugg code (code is only successfully running like 1/4 of the time)
(check to see when semicolons/other formatting things are required - how much
is the syntax comparable to coding done in Jupiter notebook (should I just do
the analysis in Jupiter notebook and then copy over or is that too much work?)
    - reliability issue partially due to the fact that I based the code on an
        Jupiter Lab project and there is not perfect 1:1 crossover of formats
- added a gitignore file to prevent mac ds store files
- create a rough outline of all of the code that I will be working on editing
in the coming weeks
1) The data is loaded and empty rows are removed to prepare it for analysis
2) Angular Velocity in the sagittal plane is plotted and a vertical line marks
the 'push' time.
3) Angular displacement is computed via trapezoidal integration and plotted alongside
angular velocity.
4) A function calculates the inclination angle using accelerometer data.
5) Errors and plotted and analyzed
    - a moving average is applied to smooth noisy inclinometer data, and angular
        displacement is detrended

Selena - I'm still having some huge issues with bugs. One thing that I tried
to do this week is get a full outline of the code I was going to use, and then
I can go back and keep editing it until it works. Also, as I go back and make
the edits, I'll make sure I get all of the questions answered.

8/23
First week of semester - did not get anything done, sorry.

8/30
trying to figure out initial error with getting data incorporated (that way I
can tell if the rest of my code even works)
Questions to ask:
- has anyone been able to set up a direct link between data in box and an analysis
on MATLAB? Have seen some posts saying there is a way to link with an API to
box so that your analysis can automatically update itself
- if not, am I allowed to download a csv file from box to create the analysis for
it - there seems to be an easy way to upload data into MATLAB if it is coming
directly from my own computer

can add it to your fille path: addpath(genpath(pwd))
pulling in data from other folder: load(Data\swayData.mat') - the slash means that it's coming
from another folder
deliminator will allow you to tell MATLAB what your data is divided by so it will
automatically fix your table