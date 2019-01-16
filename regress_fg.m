function [bitmap, dt] = regress_fg(bitmap, px_cm, oxidizer_flow_rate_g_s, dt, a, n, threshold)
% bitmap = regress_fg(bitmap, px_cm, oxidizer_flow_rate_g_s, dt, a, n, threshold)
% regress_fg takes in a fuel grain bitmap, px_cm unit converter, oxidizer flow
% rate, and a time duration, and returns a new fuel grain bitmap that has been
% regressed accordingly. The function optionally accepts values for a, n, and
% a threshold, using default HTPB values if the arguments are left out or empty.


if ~exist('a','var') || isempty(a)
    a = 0.417; % for HTPB
end
if ~exist('n','var') || isempty(n)
    n = 0.347; % for HTPB
end
if ~exist('threshold','var') || isempty(threshold)
    threshold = 0.35; % from Andrew Bath's master's thesis
end

% sum(bitmap(:)) returns the number of pixels that are 1 in the whole bitmap
opening_cm2 = sum(bitmap(:))/(px_cm^2);

% I don't understand why the length of the fuel grain doesn't matter here.
G = oxidizer_flow_rate_g_s/opening_cm2;

% I don't understand how the units work out on this next line.
r_dot_desired_cm_s = a*G^n/10; % Since a*G^n returns mm/s
%disp(r_dot_desired_cm_s)

% Compute the best dt if one wasn't provided
if ~exist('dt','var') || isempty(dt)
    dt = (size(bitmap,1)-1)/60/r_dot_desired_cm_s/px_cm; % Andrew Bath's master's thesis implied 15 pixels on a 901x901 image
else
    r_dot_desired_px = round(r_dot_desired_cm_s*px_cm*dt);
    dt = r_dot_desired_px/r_dot_desired_cm_s/px_cm;
end

% Unit conversion and round(), since we can only handle integer number of pixels
r_dot_desired_px = round(r_dot_desired_cm_s*px_cm*dt);

% The threshold will cause the regression to go slower than planned, so this
% function iteratively searches for a new r_dot_px that, given the threshold,
% actually achieves r_dot_desired_px
[r_dot_px, M_check] = get_r_dot_M(r_dot_desired_px, threshold);

if r_dot_px < 20
%    disp(sprintf('Warning: disk filter radius is <20 pixels (%d). Consider using a higher resolution or longer dt',r_dot_px));
end

if r_dot_px >200
%    disp(sprintf('Warning: disk filter radius is >200 pixels (%d). Consider using a lower resolution or shorter dt. (This might take a long time to process)',r_dot_px));
end

% Apply the disk filter and threshold to model the regression:
disk_filter = fspecial('disk', r_dot_px);
filtered_bitmap = imfilter(bitmap, disk_filter, 'replicate');
bitmap = double(filtered_bitmap>threshold | bitmap);
