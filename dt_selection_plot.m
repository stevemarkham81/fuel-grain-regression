complex_4095px_0p1s_0p35_q = run_and_save('', 2047, 0.35, 0.1, 'fg_complex', 'data');
complex_4095px_0p2s_0p35_q = run_and_save('', 2047, 0.35, 0.2, 'fg_complex', 'data');
complex_4095px_0p5s_0p35_q = run_and_save('', 2047, 0.35, 0.5, 'fg_complex', 'data');
complex_4095px_1p0s_0p35_q = run_and_save('', 2047, 0.35, 1.0, 'fg_complex', 'data');
complex_4095px_2p0s_0p35_q = run_and_save('', 2047, 0.35, 2.0, 'fg_complex', 'data');

ds_array = [complex_4095px_0p1s_0p35_q complex_4095px_0p2s_0p35_q complex_4095px_0p5s_0p35_q ...
            complex_4095px_1p0s_0p35_q complex_4095px_2p0s_0p35_q];
            
figure
for i=1:length(ds_array)
  plot(ds_array(i).time,ds_array(i).area_cm2,...
    'DisplayName',sprintf('dt=%.1fs (Runtime=%.1fs)',ds_array(i).target_dt,ds_array(i).runtime(end-1)));
  hold all
end            

lh = legend('show');
set(lh,'Location','SouthEast');
grid on
xlabel('Time (s)')
ylabel('Opening Area (cm^2)');
title('4095px, Th=0.35');

figure
plot(complex_4095px_0p2s_0p35_q.boundaries_cm{1}(:,1),complex_4095px_0p2s_0p35_q.boundaries_cm{1}(:,2),...
     'DisplayName',sprintf('Time=0s'));
hold all
linestyle = '--';
for t = [4 10]
  if strcmp(linestyle,'--')
    linestyle='-';
  else
    linestyle='--';
  end
  
  for i = 1:length(ds_array)
    [~, i_t] = min(abs(t-ds_array(i).time));
    plot(ds_array(i).boundaries_cm{i_t}(:,1),ds_array(i).boundaries_cm{i_t}(:,2),'--',...
       'DisplayName',sprintf('dt=%.1fs Time=%.1fs',ds_array(i).target_dt,ds_array(i).time(i_t)));
  end
end

lh = legend('show');
set(lh,'Location','SouthEast');
grid on
xlabel('(cm)')
ylabel('(cm)');
title('FG Boundary, 4095px, Th=0.35');