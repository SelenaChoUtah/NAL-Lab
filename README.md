# NAL Undergrads landing page

The purpose of this repository is have the undergrads start using GitHub 
and share codes. It contains starting IMU analysis with real data they can
work with. 

## Getting started on MATLAB
[Matlab OnRamp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted)
is a great place to start understanding how Matlab works and how to code. We assume you 
already have MATLAB installed with the following toolboxes: Signal Processing, Statistics and
Machine Learning, Wavelet.

## Getting starting using Git
[Powerpoint on intro to Git and Github](https://tinyurl.com/git-slides-swc)
This ppt was created the University of Utah (DELPHI) Data Science Initiative. It
goes through how to download and install Git for IOS and Windows. If you don't have a Git 
account yet, make one :) I really recommend following the entire ppt, I swear it goes by fast.

To enable source-control in MATLAB: **Matlab>Home Tab>Preferences>General>Source
Control>Select ”Enable Mathworks source control integration>Apply>OK**. You can check if Git is 
installed by typing `!git --version` in the MATLAB Command Window.

Hot tip: Using Git in MATLAB is just like using it like normally in a terminal or command window
**EXCEPT** you have to place an **exclamation (!)** in front of git. (ex/ `!git push, !git commit`)

## Access to the Repository
Ask the REPO owner to add you as a collaborator (Probably me, Selena) after you have completed the steps above. 
After being added, return to Matlab. Ideally, go to a folder like Box or wherever you want to work on the 
project. Paste `git clone --depth=1 https://github.com/SelenaChoUtah/Undergrads` into the command window, and it
will clone the entire Undergrads repo into your folder. In the _Undergrads_ folder, create your own folder with your 
own name (Right-click into the _ _) Here, you can start working on your project. Create a readme file (which is a *.md file) so 
aka `myReadMe.md` and write whatever you want in it. There's a saying that *Commit early, commit often* where 
people commit several times a day, with messages that shortly describe what they do and the end of the day, they push. 
Get handy using the following commands:
1. `!git add .`: Adds all the new files to the staging area
2. `!git commit -m "Whatever short description"`: Commits changes to your local git repo on your computer
3. `!git push`: Pushes the locally committed changes to the remote GitHub repo
4. `!git pull`: Pulls the most recent changes to the repo

Try using the commands above into the _Command Window_ and see if you can push your folder and readme file
into GitHub. Check on the online github to see if it worked! **BUT** if you can an error about dubious ownership, 
search for **Git Bash** on your computer and copy and paste what the command window wants you do into there. The line might 
be something like `git config --global --add safe.directory C:/Users/u6052635/Box/CeciliaMonoli/Github-Undergrads/Undergrads`,
**It will be individual to you!!**. After pasting and running that line into GitBash, return to Matlab, and try add the 
folder and readme file with `!git add .` and the rest of the commands til `!git push`.
   










