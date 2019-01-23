function [r_px, M_check] = get_r_M(r_desired_px, threshold)

if abs(threshold-0.35)<1e-3
    % I precomputed a bunch of values for threshold=0.35, and the answer turns
    % out to be linear, so we can vastly speed up the iterative search by
    % starting with a really good guess.
    M_guess = round(polyval([3.2024 -1.4988], r_desired_px));
else
    % Did some more precomputing, and for any given threshold, the value
    % is linear, and the slope as a function of threshold is roughly
    % cubic, so we can get a decent guess for any arbitrary threshold
    % with this:
    p_M_check = [115.68485   -38.29749     8.68760    -0.12007];
    p_fit_M_check(1,1) = polyval(p_M_check,threshold);
    p_fit_M_check(1,2) = 0.5;
    
    M_guess = round(polyval(p_fit_M_check, r_desired_px));
end
%disp(sprintf('Guessed %d', M_guess));

r_px = r_desired_px + M_guess;

bitmap_row = [zeros(1,r_px+1) ones(1,r_px+1)];
disk_filter = fspecial('disk', r_px);
filtered_row = imfilter(bitmap_row, disk_filter, 'replicate');
r_actual = r_px+2 - find(filtered_row>threshold,1);
M_check = r_px - r_actual;

while M_check ~= M_guess
    M_guess = M_check;
    disp(sprintf('Guessed %d', M_guess));

    r_px = r_desired_px + M_guess;
    
    bitmap_row = [zeros(1,r_px+1) ones(1,r_px+1)];
    disk_filter = fspecial('disk', r_px);
    filtered_row = imfilter(bitmap_row, disk_filter, 'replicate');
    r_actual = r_px+2 - find(filtered_row>threshold,1);
    M_check = r_px - r_actual;
    
end

