function [bitmap, dt] = regress_fg(bitmap, px_cm, r_dot_desired_cm_s, dt, threshold)
% bitmap = regress_fg(bitmap, px_cm, r_dot_desired_cm_s, dt)
% regress_fg takes in a fuel grain bitmap, px_cm unit converter, regression 
% rate, threshold, and a time duration, and returns a new fuel grain bitmap that has been
% regressed accordingly. If the duration is not provided, it will be computed 
% such that 1/60th of the FG will be regressed, and this value will be returned. 
% If the duration is provided, the output duration will be the adjusted dt such
% that no pixel rounding would be needed to effect the same regression.

% Compute the best dt if one wasn't provided
if ~exist('dt','var') || isempty(dt)
    dt = (size(bitmap,1)-1)/60/r_dot_desired_cm_s/px_cm; % Andrew Bath's master's thesis implied 15 pixels on a 901x901 image
else
    r_desired_px = round(r_dot_desired_cm_s*px_cm*dt);
    dt = r_desired_px/r_dot_desired_cm_s/px_cm;
end

if ~exist('threshold','var') || isempty(threshold)
    threshold = 0.35; % Andrew Bath's master's thesis used 0.35
end

% Unit conversion and round(), since we can only handle integer number of pixels
r_desired_px = round(r_dot_desired_cm_s*px_cm*dt);

% The threshold will cause the regression to go slower than planned, so this
% function iteratively searches for a new r_px that, given the threshold,
% actually achieves r_dot_desired_px
[r_px, M_check] = get_r_M(r_desired_px, threshold);

if r_px < 20
%    disp(sprintf('Warning: disk filter radius is <20 pixels (%d). Consider using a higher resolution or longer dt',r_px));
end

if r_px >200
%    disp(sprintf('Warning: disk filter radius is >200 pixels (%d). Consider using a lower resolution or shorter dt. (This might take a long time to process)',r_px));
end

% Apply the disk filter and threshold to model the regression:
disk_filter = fspecial('disk', r_px);
filtered_bitmap = imfilter(bitmap, disk_filter, 'replicate');
bitmap = double(filtered_bitmap>threshold | bitmap);
