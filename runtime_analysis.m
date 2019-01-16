oxidizer_flow_rate_g_s = 4344.618; % g/s
threshold = 0.35;
target_dt = 1;

npxpss = [257 513 1025 2049];
mean_time_per_iteration = zeros(size(npxpss));

for i = 1:length(npxpss)
  npxps = npxpss(i);
  [fg_bitmap, px_cm] = get_fg_bitmap(npxps);
  
  [time, rdot_cm_s, dt, runtime, min_radius, max_radius, area_px2, area_cm2, boundaries_cm] = model_full_burn(fg_bitmap, px_cm, oxidizer_flow_rate_g_s, threshold, target_dt);
  mean_time_per_iteration(i) = mean(diff(runtime(~isnan(runtime))));  
end  