function [bitmap, px_cm] = get_circle_fg_bitmap(id_cm, od_cm, npxps)
% [bitmap, cm] = get_circle_fg_bitmap(id_cm, od_cm, npxps)
% This function returns a square image representing a circular/tubular fuel
% grain. It takes three input parameters, the inner diameter (cm), outer 
% diameter (cm), and number of pixels per side of square. As an additional
% output argument it returns the unit converter "px_cm" with units of pixels/cm.

radius_in_pixels = (npxps+1)/2;
px_cm = 2*(radius_in_pixels-1)/od_cm;

[xx,yy]=meshgrid(-radius_in_pixels+1:radius_in_pixels-1);
r_px = sqrt(xx.^2+yy.^2);
theta = atan2d(yy,xx);
bitmap = zeros(size(xx));

% Just a single hole in the middle
bitmap(r_px<(id_cm*px_cm/2)) = 1;