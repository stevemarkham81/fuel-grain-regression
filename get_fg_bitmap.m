function [bitmap, px_cm] = get_fg_bitmap(npxps)
% This function will return a black and white image represented by a matrix of 
% bits, 1 for white, 0 for black, that represent the fuel grain shape. If we
% want to eventual get fancy, we can have the function take arguments such as
% radius or number of spokes or spoke width or whatever. For now I've hard-
% coded everything according to your sketch.

% Define the dimensions of the image and how it relates to real-world size
if ~exist('npxps','var')||isempty(npxps)
    radius_in_pixels = 451;
else
    radius_in_pixels = ((npxps-1)/2) + 1;
end
radius_in_inches = 4; % Melanie to double-check this
in = (radius_in_pixels-1)/radius_in_inches; % has units pixels/inch
px_cm = in/2.54;

% meshgrid() is a function that takes a 1xN array and copies it N times, to
% return two NxN matrices. One of them as the original array in every row, the
% other has the original array in every column.

% In Matlab/Ocatve, the colon operator returns a number sequence, so for
% example, 1:5 means [1 2 3 4 5].
[xx,yy]=meshgrid(-radius_in_pixels+1:radius_in_pixels-1);

% xx is the x coordinate of every pixel in the image. Every row is the same,
% [-451 -450 -449 ... -1 0 1 2 ... 450 451]
% yy is the y coordinate of every pixel in the image. Every column is the same,
% and it is simply xx transposed and flipped.

% Next, we compute the polar coordinates for each pixel, since our shape is
% conveninet to describe in terms of circles.
r = sqrt(xx.^2+yy.^2);
% atan2 is the inverse tangent, but always returns values from -180 to 180
theta = atan2d(yy,xx); 

% Start with a solid block of all zeros. zeros() itself is a function that takes
% two arguments, the width and height, and returns a matrix of zeros of that 
% size.  size() is a function that takes a matrix and returns its size. So the
% code below sets bitmap equal to a matrix of all zeros that is the same size as
% xx.
bitmap = zeros(size(xx));

% We will use "logical indexing" to set parts of the bitmap to 1. Normally, to
% access an element of a matrix we give two inputs, eg, "bitmap(1,1)" is the top
% left pixel. However, we can give a logical/boolean matrix of the same size as 
% bitmap to get all the values where the input is true.

% Blank out everything in the inner circle. Since your sketch shows an inner
% diameter of 2.75", we use a radius of 1.375, or 11/8. To convert inches to 
% pixels we use the conversion factor we defined above, in.  So 11/8*in is the
% number of pixels in 1 3/8".  We compare r to that value, and get a boolean magic
% matrix that is true everywhere that r is less than it, with "r<(11/8*in)". We
% give that boolean matrix as input to bitmap to refer to the corresponding 
% elements of bitmap, which we then set to 1.
bitmap(r<(11/8*in))=1;

% Blank out everything in the spokes. We'll go one spoke at a time. There are 6
% spokes around the 360 degrees of the circle, so every 60 degrees. We can use
% the colon operator again, but this time instead of counting by 1, we count by
% 60 with a double colon. t will be [-180 -120 -60 0 60 120 180].
% Then we use a for loop, so the code inside the for/end section will get run
% once for each value of t.
for t=-180:60:180
  % abs() is absolute value. abs(theta+t)<15 is true when theta is within 15 
  % degrees of t. & is an element-wise logical AND, meaning it is true if both
  % sides are true, and if you give it a matrix on one or both sides, then it
  % returns a matrix where each element is true if the elements of the inputs 
  % were both true. r<27/8*in is true when the radius is less than the outer
  % diamter of 6 3/4" from your skitch.
  bitmap(abs(theta+t)<15 & r<27/8*in)=1;
end

% Up above when we said "function [bitmap] = yadda yadda yadda" it means that
% this function will return the value in bitmap when it ends.
endfunction

