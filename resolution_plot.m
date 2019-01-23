complex_257px_0p5s_0p00_q = run_and_save('', 257, 0.0, 0.5, 'fg_complex', 'data');
complex_513px_0p5s_0p00_q = run_and_save('', 513, 0.0, 0.5, 'fg_complex', 'data');
complex_1025px_0p5s_0p00_q = run_and_save('', 1025, 0.0, 0.5, 'fg_complex', 'data');
complex_2047px_0p5s_0p00_q = run_and_save('', 2047, 0.0, 0.5, 'fg_complex', 'data');
complex_2049px_0p5s_0p00_q = run_and_save('', 2049, 0.0, 0.5, 'fg_complex', 'data');
complex_4095px_0p5s_0p00_q = run_and_save('', 4095, 0.0, 0.5, 'fg_complex', 'data');
complex_8191px_0p5s_0p00_q = run_and_save('', 8191, 0.0, 0.5, 'fg_complex', 'data');
complex_16383px_0p5s_0p00_q = run_and_save('', 16383, 0.0, 0.5, 'fg_complex', 'data');

ds_array = [complex_257px_0p5s_0p00_q complex_513px_0p5s_0p00_q ...
            complex_1025px_0p5s_0p00_q complex_2047px_0p5s_0p00_q ...
            complex_2049px_0p5s_0p00_q complex_4095px_0p5s_0p00_q ...
            complex_8191px_0p5s_0p00_q complex_16383px_0p5s_0p00_q];

resolutions = [257 513 1025 2047 2049 4095 8191 16383];

figure
for i=1:length(ds_array)
  plot(ds_array(i).time,ds_array(i).area_cm2,'DisplayName',sprintf('%dpx',ds_array(i).npxps));
  hold all
end

lh = legend('show');
grid on
xlabel('Time (s)')
ylabel('Opening Area (cm^2)');
title('dt=0.5s, Th=0');


complex_257px_0p5s_0p35_q = run_and_save('', 257, 0.35, 0.5, 'fg_complex', 'data');
complex_513px_0p5s_0p35_q = run_and_save('', 513, 0.35, 0.5, 'fg_complex', 'data');
complex_1025px_0p5s_0p35_q = run_and_save('', 1025, 0.35, 0.5, 'fg_complex', 'data');
complex_2047px_0p5s_0p35_q = run_and_save('', 2047, 0.35, 0.5, 'fg_complex', 'data');
complex_2049px_0p5s_0p35_q = run_and_save('', 2049, 0.35, 0.5, 'fg_complex', 'data');
complex_4095px_0p5s_0p35_q = run_and_save('', 4095, 0.35, 0.5, 'fg_complex', 'data');
complex_8191px_0p5s_0p35_q = run_and_save('', 8191, 0.35, 0.5, 'fg_complex', 'data');

ds_array = [complex_257px_0p5s_0p35_q complex_513px_0p5s_0p35_q ...
            complex_1025px_0p5s_0p35_q complex_2047px_0p5s_0p35_q ...
            complex_2049px_0p5s_0p35_q complex_4095px_0p5s_0p35_q ...
            complex_8191px_0p5s_0p35_q ];

resolutions = [257 513 1025 2047 2049 4095 8191];

figure
for i=1:length(ds_array)
  plot(ds_array(i).time,ds_array(i).area_cm2,'DisplayName',sprintf('%dpx',ds_array(i).npxps));
  hold all
end

lh = legend('show');
grid on
xlabel('Time (s)')
ylabel('Opening Area (cm^2)');
title('dt=0.5s, Th=0.35');


complex_257px_1p0s_0p00_q = run_and_save('', 257, 0, 1.0, 'fg_complex', 'data');
complex_513px_1p0s_0p00_q = run_and_save('', 513, 0, 1.0, 'fg_complex', 'data');
complex_1025px_1p0s_0p00_q = run_and_save('', 1025, 0, 1.0, 'fg_complex', 'data');
complex_2047px_1p0s_0p00_q = run_and_save('', 2047, 0, 1.0, 'fg_complex', 'data');
complex_2049px_1p0s_0p00_q = run_and_save('', 2049, 0, 1.0, 'fg_complex', 'data');
complex_4095px_1p0s_0p00_q = run_and_save('', 4095, 0, 1.0, 'fg_complex', 'data');
complex_8191px_1p0s_0p00_q = run_and_save('', 8191, 0, 1.0, 'fg_complex', 'data');

ds_array = [complex_257px_1p0s_0p00_q complex_513px_1p0s_0p00_q ...
            complex_1025px_1p0s_0p00_q complex_2047px_1p0s_0p00_q ...
            complex_2049px_1p0s_0p00_q complex_4095px_1p0s_0p00_q ...
            complex_8191px_1p0s_0p00_q ];

resolutions = [257 513 1025 2047 2049 4095 8191];

figure
for i=1:length(ds_array)
  plot(ds_array(i).time,ds_array(i).area_cm2,'DisplayName',sprintf('%dpx',ds_array(i).npxps));
  hold all
end

lh = legend('show');
grid on
xlabel('Time (s)')
ylabel('Opening Area (cm^2)');
title('dt=1.0s, Th=0');

complex_257px_1p0s_0p35_q = run_and_save('', 257, 0.35, 1.0, 'fg_complex', 'data');
complex_513px_1p0s_0p35_q = run_and_save('', 513, 0.35, 1.0, 'fg_complex', 'data');
complex_1025px_1p0s_0p35_q = run_and_save('', 1025, 0.35, 1.0, 'fg_complex', 'data');
complex_2047px_1p0s_0p35_q = run_and_save('', 2047, 0.35, 1.0, 'fg_complex', 'data');
complex_2049px_1p0s_0p35_q = run_and_save('', 2049, 0.35, 1.0, 'fg_complex', 'data');
complex_4095px_1p0s_0p35_q = run_and_save('', 4095, 0.35, 1.0, 'fg_complex', 'data');
complex_8191px_1p0s_0p35_q = run_and_save('', 8191, 0.35, 1.0, 'fg_complex', 'data');

ds_array = [complex_257px_1p0s_0p35_q complex_513px_1p0s_0p35_q ...
            complex_1025px_1p0s_0p35_q complex_2047px_1p0s_0p35_q ...
            complex_2049px_1p0s_0p35_q complex_4095px_1p0s_0p35_q ...
            complex_8191px_1p0s_0p35_q ];

resolutions = [257 513 1025 2047 2049 4095 8191];

figure
for i=1:length(ds_array)
  plot(ds_array(i).time,ds_array(i).area_cm2,'DisplayName',sprintf('%dpx',ds_array(i).npxps));
  hold all
end

lh = legend('show');
grid on
xlabel('Time (s)')
ylabel('Opening Area (cm^2)');
title('dt=1.0s, Th=0.35');
