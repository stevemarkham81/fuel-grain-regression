oxidizer_flow_rate_g_s = 4344.618; % g/s
data_folder='data';

for threshold = [0 0.1 0.2 0.35]
for target_dt = [0.5 1]


npxpss = [257 513 1025 2049];
mean_time_per_iteration = zeros(size(npxpss));

for i = 1:length(npxpss)
  npxps = npxpss(i);
  
  dt_str = sprintf('%dp%d',floor(target_dt),floor(10*mod(target_dt,1)));
  threshold_str = sprintf('0p%02d',floor(100*threshold));
  data_file_name = sprintf('%s_%dpx_%ss_%s.mat','fg_complex',npxps,dt_str, threshold_str);
  data_file = fullfile(data_folder,data_file_name);
  if ~exist(data_file,'file')
  
    [fg_bitmap, px_cm] = get_fg_bitmap(npxps);
    
    [time, rdot_cm_s, dt, runtime, min_radius, max_radius, area_px2, area_cm2, boundaries_cm] = model_full_burn(fg_bitmap, px_cm, oxidizer_flow_rate_g_s, threshold, target_dt);
    save(data_file,'time','rdot_cm_s','runtime','min_radius','max_radius',...
                   'area_px2','area_cm2','boundaries_cm','threshold','target_dt',...
                   'px_cm','npxps','oxidizer_flow_rate_g_s');
  else
    load(data_file,'runtime');
  end
  mean_time_per_iteration(i) = mean(diff(runtime(~isnan(runtime))));
end  

end % target_dt
end % threshold