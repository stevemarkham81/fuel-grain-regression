# fuel-grain-regression

This software package models the regression of the solid fuel grain in a hybrid rocket. It uses an image-processing technique described by Andrew Bath in his Master's thesis: https://digitalcommons.usu.edu/etd/1381/

A cross-section of the fuel grain is represented as a binary image, with white pixels (value=1) representing empty space, and black pixels (value=0) representing unburned fuel grain.  At each iteration, the regression rate is computed, based on constants for the fuel type, the oxidizier flow rate, and the port area. The software can automatically choose a time duration of each iteration to avoid pixel rounding errors.
