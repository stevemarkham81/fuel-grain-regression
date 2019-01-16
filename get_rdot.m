function [r_dot_desired_cm_s] = get_rdot(fg_bitmap, px_cm, oxidizer_flow_rate_g_s, a, n)
  
  if ~exist('a','var') || isempty(a)
    a = 0.417; % for HTPB
  end
  if ~exist('n','var') || isempty(n)
      n = 0.347; % for HTPB
  end
  
  opening_cm2 = sum(fg_bitmap(:))/(px_cm^2);
  G = oxidizer_flow_rate_g_s/opening_cm2;
  
  r_dot_desired_cm_s = a*G^n/10; % Since a*G^n returns mm/s

endfunction
