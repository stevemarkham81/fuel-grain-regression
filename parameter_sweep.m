oxidizer_flow_rate_g_s = 4344.618; % g/s
data_folder='data';

for threshold = [0]
for target_dt = [0.5]
geometry_str = 'fg_complex';

% npxpss = [257 513 1025 2049 2047 4095];
npxpss = [2047 4095 8191 16383];

for i = 1:length(npxpss)
  
  run_and_save(oxidizer_flow_rate_g_s, npxpss(i), threshold, target_dt, geometry_str, data_folder);
  
end  

end % target_dt
end % threshold