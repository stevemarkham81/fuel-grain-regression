function datastruct = run_and_save(oxidizer_flow_rate_g_s, npxps, threshold, target_dt, geometry_str, data_folder)
  
  if ~exist('oxidizer_flow_rate_g_s','var') || isempty(oxidizer_flow_rate_g_s)
    oxidizer_flow_rate_g_s = 4344.618; % g/s
  end
  if ~exist('npxps','var') || isempty(npxps)
    npxps = 4095; 
  end
  if ~exist('threshold','var') || isempty(threshold)
    threshold = 0.35; 
  end
  if ~exist('target_dt','var') || isempty(target_dt)
    target_dt = 1.0; 
  end
  if ~exist('geometry_str','var') || isempty(geometry_str)
    geometry_str = 'fg_complex';
  end
  if ~exist('data_folder','var') 
    data_folder = 'data';
  end
  
  dt_str = sprintf('%dp%d',floor(target_dt),floor(10*mod(target_dt,1)));
  threshold_str = sprintf('0p%02d',floor(100*threshold));
  
  data_file_name = sprintf('%s_%dpx_%ss_%s_q.mat',geometry_str,npxps,dt_str, threshold_str);
  data_file = fullfile(data_folder,data_file_name);
  
  if ~exist(data_file,'file')
  
    if strcmp(geometry_str,'fg_complex')
      [fg_bitmap, px_cm] = get_fg_bitmap(npxps);
    else
      error('Unknown geometry %s',geometry_str);
    end
    
    [time, rdot_cm_s, dt, runtime, min_radius, max_radius, area_px2, area_cm2, boundaries_cm] = model_full_burn(fg_bitmap, px_cm, oxidizer_flow_rate_g_s, threshold, target_dt);
    save(data_file,'time','rdot_cm_s','runtime','min_radius','max_radius',...
                   'area_px2','area_cm2','boundaries_cm','threshold','target_dt',...
                   'px_cm','npxps','oxidizer_flow_rate_g_s');
  end
  
  if nargout>=1
    datastruct = load(data_file);
  end
endfunction
