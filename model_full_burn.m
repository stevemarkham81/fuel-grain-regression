function [time, rdot_cm_s, dt, runtime, min_radius, max_radius, area_px2, area_cm2, boundaries_cm] = ...
  model_full_burn(fg_bitmap, px_cm, oxidizer_flow_rate_g_s, threshold, target_dt, target_rdot_px, max_regression_steps)
  
  % Check inputs
  if ~exist('oxidizer_flow_rate_g_s','var') || isempty(oxidizer_flow_rate_g_s)
    oxidizer_flow_rate_g_s = 4344.618; % g/s
  end
  if ~exist('threshold','var') || isempty(threshold)
    threshold = 0.35; % from Andrew Bath's master's thesis
  end
  if (exist('target_dt','var') && ~isempty(target_dt)) && (exist('target_rdot_px','var') && ~isempty(target_rdot_px))
    error('Only provide target_dt or target_rdot_px, not both');
  elseif exist('target_rdot_px','var') && ~isempty(target_rdot_px)
    target_dt = [];
  elseif exist('target_dt','var') && ~isempty(target_dt)
    target_rdot_px = [];
  else
    target_dt = 1;
    target_r_dot_px = [];
  end
  if ~exist('max_regression_steps','var') || isempty(max_regression_steps)
    max_regression_steps = Inf;
  end
  
  % Initialize outputs
  time = zeros(2,1);
  rdot_cm_s = zeros(2,1);
  dt = zeros(2,1);
  runtime = zeros(2,1);
  min_radius = zeros(2,1);
  max_radius = zeros(2,1);
  area_px2 = zeros(2,1);
  area_cm2 = zeros(2,1);
  boundaries_cm = {};
  
  % Re-create some fg bitmap measures
  npxps = size(fg_bitmap,1);
  assert(size(fg_bitmap,2)==npxps);
  radius_in_pixels = (npxps+1)/2;
  [xx,yy]=meshgrid(-radius_in_pixels+1:radius_in_pixels-1);
  r_px = sqrt(xx.^2+yy.^2);
  r_cm = r_px/px_cm;
  x_cm = xx/px_cm;
  y_cm = yy/px_cm;
  
  % Time=0
  regression_step = 1;
  b = bwboundaries(fg_bitmap);
  
  time(regression_step) = 0;
  rdot_cm_s(regression_step) = NaN;
  dt(regression_step) = NaN;
  runtime(regression_step) = NaN;
  min_radius(regression_step) = min(r_cm(sub2ind(size(r_cm),b{1}(:,1),b{1}(:,2))));
  max_radius(regression_step) = max(r_cm(sub2ind(size(r_cm),b{1}(:,1),b{1}(:,2))));
  area_px2(regression_step) = sum(fg_bitmap(:));
  area_cm2(regression_step) = area_px2(regression_step)./(px_cm^2);
  boundaries_cm{regression_step} = [x_cm(sub2ind(size(x_cm),b{1}(:,1),b{1}(:,2))) y_cm(sub2ind(size(x_cm),b{1}(:,1),b{1}(:,2)))];
  
  start_tic = tic;
  
  % Start the burn
  while regression_step < max_regression_steps
    rdot_cm_s(regression_step) = get_rdot(fg_bitmap, px_cm, oxidizer_flow_rate_g_s);
    if ~isempty(target_rdot_px)
      target_dt = target_rdot_px/(rdot_cm_s(regression_step)*px_cm);
    end
    
    [fg_bitmap, dt(regression_step)] = regress_fg(fg_bitmap, px_cm, rdot_cm_s(regression_step), target_dt, threshold);
    runtime(regression_step) = toc(start_tic);
    
    regression_step = regression_step + 1;
    b = bwboundaries(fg_bitmap);
    
    time(regression_step) = time(regression_step-1)+dt(regression_step-1);
    rdot_cm_s(regression_step) = NaN;
    dt(regression_step) = NaN;
    runtime(regression_step) = NaN;
    min_radius(regression_step) = min(r_cm(sub2ind(size(r_cm),b{1}(:,1),b{1}(:,2))));
    max_radius(regression_step) = max(r_cm(sub2ind(size(r_cm),b{1}(:,1),b{1}(:,2))));
    area_px2(regression_step) = sum(fg_bitmap(:));
    area_cm2(regression_step) = area_px2(regression_step)./(px_cm^2);
    boundaries_cm{regression_step} = [x_cm(sub2ind(size(x_cm),b{1}(:,1),b{1}(:,2))) y_cm(sub2ind(size(x_cm),b{1}(:,1),b{1}(:,2)))];
    
    % Break for burn-through
    if any(fg_bitmap(1,:))||any(fg_bitmap(end,:))||any(fg_bitmap(:,1))||any(fg_bitmap(:,end))
      break;
    end
    
  end

endfunction
