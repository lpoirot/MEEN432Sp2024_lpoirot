# MEEN 432 Spring 2024
Repository for MEEN 432 Automotive Engineering
Luke Poirot - UIN: 730000185

# Project 4 Instructions
Instructions for Running Project 4:
1. Download all files from the Project4 folder
2. Run P4init.m
3. Run p4sim.m to plot the driving trail
4. Run P4_V4.slx and check the plot to see if the x and y coordinates look correct. Make sure the stop time is set to 3600 seconds
5. Run FinalRace.m to receive all of the desired data
6. The simulation will take several minutes to run - I was not able to optimize it and make it more efficient

The regen breaking violation will be triggered. 
I was not able to figure out the gain that should go to the APP% such that the regen breaking violation is not passed.
Whenever I passed a percentage of the breaking (usually around 90) to the APP %, the entire car broke and made huge ovals at speeds of ~270 m/s.
