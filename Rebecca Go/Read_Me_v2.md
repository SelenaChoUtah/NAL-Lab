Read Me

In this series of folders is a collection of aptly named MATLAB code to 
support the processing and visualization of the data associated with the 
turning study.

This includes a function (titled "importfileOpenCap.m") that is required 
to open the individual OpenCap folders. 

In order to process the data from individuals subjects, the code scripts
are organized in order of the data they process.

The file "Float_OpenCap.m" processes, visualizes, and summarizes the data
collected using the OpenCap motion capture system. The data files are trc
marker files. It currently does not have the capacity to go through several
participants at once, but if you change the iterator "i," you will be able 
to change the participant file you open (e.g. "Sub_01" or "Sub_02"). 
Changing the iterator "j" allows you to change the participant trial that 
you look at (e.g. "Fast_Walk_01" or "Med_Walk_01"). Also, it does not
have the capability to summarize the data to one single document, so I've
been copying the data of interest into a summary excel sheet. 

The file "LoadSol_Process.m" processes and visualizes the data collected 
from the loadsol pressure sensors. The data files are text files.

Test comment!