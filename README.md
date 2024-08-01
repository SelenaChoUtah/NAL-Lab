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
account yet, make one :) I really recommend following the entire ppt, I swear it goes by fast. If 
you don't want to go through it, follow it up to **slide 8** about configuring terminal: 
   1. Find the download link in PPT (slide 6). Go through the entire install, just keep hitting next, there's nothing special you need to select
   2. Search **Git Bash** on your computer.
   3. Set up your name and GitHub email
   4. `git config --global user.name "Vlad Dracula"` with your name
   5. `git config --global user.email "vlad@tran.sylvan.ia"` with your GitHub email 

### Set up source-control in MATLAB
**Matlab>Home Tab>Preferences>General>Source Control>Select ”Enable Mathworks source control integration>Apply>OK**. You can check if Git is 
installed by typing `!git --version` in the MATLAB Command Window.

Hot tip: Using Git in MATLAB is just like using it like normally in a terminal or command window
**EXCEPT** you have to place an **exclamation (!)** in front of git. (ex/ `!git push, !git commit`)

## Access to the Repository
Ask the REPO owner to add you as a collaborator (Probably me, Selena) after you have completed the steps above. 
After being added, return to Matlab. Ideally, go to a folder like Box or wherever you want to work on the 
project. Paste `git clone --depth=1 https://github.com/SelenaChoUtah/NAL-Lab` into the command window, and it
will clone the entire Undergrads repo into your folder. 

Try the following to add a folder and readME file:

1. Make sure you have accepted the invitation to collaborate on Github.
2. In the _Undergrads_ folder, create your own folder with your name (Right-click into the _Current Folder_ space **>New>Folder**) Here, you can start working on your project.
3. Create a readme file (which is a *.md file) so aka `readME.md` (Hit `ctrl`+`n` and a new window will pop up in editor). Write anything random you want in there (in the future, you will document what's in the folder and write how someone else can use your code/script/data), and hit the save button. Save the file as `myReadMe.md` and select _Save as type_ as _All Files_. **The .md is very important when naming the file**. _The *.md signifies a markdown file, which is a plain text document that uses simple syntax to format text. It allows you to create structured documents with elements like headings, lists, links, images, and code blocks that are widely used for documentation and readme files in software projects because of their readability and ease of use_.
4. `!git add .` into Command Window in Matlab
5. If you run into an error about dubious ownership, search for **Git Bash** on your computer and copy and paste what the command window wants you to do into there. The line might be something like `git config --global --add safe.directory C:/Users/u6052635/Box/CeciliaMonoli/Github-Undergrads/Undergrads`,**It will be individual to you!!** `ctrl`+`v` does not work in Git Bash, but you can **right-click>Paste**
6. Return to Matlab, run `!git add .`
7. Run `!git commit -m "Uploading folder and readme file`: -m signifies you're writing a message and you can write what message you want between the quotes. 
8. Run `!git push`: Sends your local repo to the remote/online repo
9. If you get an error that is along the lines of  _Updates were rejected because the remote contains work that you do not have locally_, this means you **DO NOT HAVE THE MOST UPDATED VERSION OF THE REPO**, in this case, just `!git pull` in the command window to get the most updated version. Afterwards, try `!git push` again, and it should work. 
10. Since this is your first time pushing, it might open a Github login where it is connecting you to the remote repository online.
11. Check on GitHub to see if your folder and readme file are there. If so, yay! If not, I (Selena) need to write better instructions.


## What does using Git look like during your day?
1. Grab your cup of coffee and open your computer.
2. Go to your Matlab project where you have the repo.
3. Type `!git pull` into your **Command Window**. Do this every morning before your start your project to have the most up-to-date repo.
4. WORK WORK WORK
5. Run `!git add .` in your **Command Window**. The period after the add, allows it to upload all of your changes regardless of folder or file.
6. Run `!git commit -m "Your Message"` in your **Command Window**. This commit your changes to your “local” git repository on your computer. Write a short description of what's updated.
7. Run `!git push`. This pushes your locally committed changes to the “remote” GitHub repository on the internet.
8. Close computer.
9. Go home.
10. Sleep and repeat.


## Handy GitHub Commands
There's a saying that *Commit early, commit often* where people commit several times a day, with messages that shortly describe what they do, and at the end of the day, they push. 
Get handy using the following commands:
1. `!git add .`: Adds all the new files to the staging area. The spacing after **add** and the **period** is important!
2. `!git commit -m "Whatever short description"`: Commits changes to your local git repo on your computer
3. `!git push`: Pushes the locally committed changes to the remote GitHub repo
4. `!git pull`: Pulls the most recent changes to the repo. Do this every time you start working to get the most recent version of the project.





   










