complex_257px_1p0s_0p35 = load(fullfile('data','fg_complex_257px_1p0s_0p35.mat'));
complex_513px_1p0s_0p35 = load(fullfile('data','fg_complex_513px_1p0s_0p35.mat'));
complex_1025px_1p0s_0p35 = load(fullfile('data','fg_complex_1025px_1p0s_0p35.mat'));
complex_2047px_1p0s_0p35 = load(fullfile('data','fg_complex_2047px_1p0s_0p35.mat'));
complex_2049px_1p0s_0p35 = load(fullfile('data','fg_complex_2049px_1p0s_0p35.mat'));
complex_4095px_1p0s_0p35 = load(fullfile('data','fg_complex_4095px_1p0s_0p35.mat'));

resolutions = [257 513 1025 2047 2049 4095];
runtime_per_iteration = [ mean(diff(complex_257px_1p0s_0p35.runtime(1:end-1))), ...
                          mean(diff(complex_513px_1p0s_0p35.runtime(1:end-1))), ...
                          mean(diff(complex_1025px_1p0s_0p35.runtime(1:end-1))), ...
                          mean(diff(complex_2047px_1p0s_0p35.runtime(1:end-1))), ...
                          mean(diff(complex_2049px_1p0s_0p35.runtime(1:end-1))), ...
                          mean(diff(complex_4095px_1p0s_0p35.runtime(1:end-1)))];
runtime_to_burnthrough = [max(complex_257px_1p0s_0p35.runtime), ...
                          max(complex_513px_1p0s_0p35.runtime), ...
                          max(complex_1025px_1p0s_0p35.runtime), ...
                          max(complex_2047px_1p0s_0p35.runtime), ...
                          max(complex_2049px_1p0s_0p35.runtime), ...
                          max(complex_4095px_1p0s_0p35.runtime)];

figure
%semilogy(resolutions, runtime_per_iteration, 'DisplayName', 'dt=1.0s, Th=0.35, Full');
loglog(resolutions, runtime_to_burnthrough, 'DisplayName', 'dt=1.0s, Th=0.35, Full');
hold all

complex_257px_1p0s_0p35_q = run_and_save('', 257, 0.35, 1.0, 'fg_complex', 'data');
complex_513px_1p0s_0p35_q = run_and_save('', 513, 0.35, 1.0, 'fg_complex', 'data');
complex_1025px_1p0s_0p35_q = run_and_save('', 1025, 0.35, 1.0, 'fg_complex', 'data');
complex_2047px_1p0s_0p35_q = run_and_save('', 2047, 0.35, 1.0, 'fg_complex', 'data');
complex_2049px_1p0s_0p35_q = run_and_save('', 2049, 0.35, 1.0, 'fg_complex', 'data');
complex_4095px_1p0s_0p35_q = run_and_save('', 4095, 0.35, 1.0, 'fg_complex', 'data');

resolutions = [257 513 1025 2047 2049 4095];
runtime_per_iteration = [ mean(diff(complex_257px_1p0s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_513px_1p0s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_1025px_1p0s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_2047px_1p0s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_2049px_1p0s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_4095px_1p0s_0p35_q.runtime(1:end-1)))];
runtime_to_burnthrough = [max(complex_257px_1p0s_0p35_q.runtime), ...
                          max(complex_513px_1p0s_0p35_q.runtime), ...
                          max(complex_1025px_1p0s_0p35_q.runtime), ...
                          max(complex_2047px_1p0s_0p35_q.runtime), ...
                          max(complex_2049px_1p0s_0p35_q.runtime), ...
                          max(complex_4095px_1p0s_0p35_q.runtime)];

%semilogy(resolutions, runtime_per_iteration, 'DisplayName', 'dt=1.0s, Th=0.35, Quartered');
loglog(resolutions, runtime_to_burnthrough, 'DisplayName', 'dt=1.0s, Th=0.35, Quartered');

complex_257px_0p5s_0p35_q = run_and_save('', 257, 0.35, 0.5, 'fg_complex', 'data');
complex_513px_0p5s_0p35_q = run_and_save('', 513, 0.35, 0.5, 'fg_complex', 'data');
complex_1025px_0p5s_0p35_q = run_and_save('', 1025, 0.35, 0.5, 'fg_complex', 'data');
complex_2047px_0p5s_0p35_q = run_and_save('', 2047, 0.35, 0.5, 'fg_complex', 'data');
complex_2049px_0p5s_0p35_q = run_and_save('', 2049, 0.35, 0.5, 'fg_complex', 'data');
complex_4095px_0p5s_0p35_q = run_and_save('', 4095, 0.35, 0.5, 'fg_complex', 'data');

resolutions = [257 513 1025 2047 2049 4095];
runtime_per_iteration = [ mean(diff(complex_257px_0p5s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_513px_0p5s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_1025px_0p5s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_2047px_0p5s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_2049px_0p5s_0p35_q.runtime(1:end-1))), ...
                          mean(diff(complex_4095px_0p5s_0p35_q.runtime(1:end-1)))];
runtime_to_burnthrough = [max(complex_257px_0p5s_0p35_q.runtime), ...
                          max(complex_513px_0p5s_0p35_q.runtime), ...
                          max(complex_1025px_0p5s_0p35_q.runtime), ...
                          max(complex_2047px_0p5s_0p35_q.runtime), ...
                          max(complex_2049px_0p5s_0p35_q.runtime), ...
                          max(complex_4095px_0p5s_0p35_q.runtime)];
%semilogy(resolutions, runtime_per_iteration, 'DisplayName', 'dt=0.5s, Th=0.35, Quartered');
loglog(resolutions, runtime_to_burnthrough, 'DisplayName', 'dt=0.5s, Th=0.35, Quartered');

complex_257px_0p5s_0p00_q = run_and_save('', 257, 0.0, 0.5, 'fg_complex', 'data');
complex_513px_0p5s_0p00_q = run_and_save('', 513, 0.0, 0.5, 'fg_complex', 'data');
complex_1025px_0p5s_0p00_q = run_and_save('', 1025, 0.0, 0.5, 'fg_complex', 'data');
complex_2047px_0p5s_0p00_q = run_and_save('', 2047, 0.0, 0.5, 'fg_complex', 'data');
complex_2049px_0p5s_0p00_q = run_and_save('', 2049, 0.0, 0.5, 'fg_complex', 'data');
complex_4095px_0p5s_0p00_q = run_and_save('', 4095, 0.0, 0.5, 'fg_complex', 'data');

resolutions = [257 513 1025 2049 4095];
runtime_per_iteration = [ mean(diff(complex_257px_0p5s_0p00_q.runtime(1:end-1))), ...
                          mean(diff(complex_513px_0p5s_0p00_q.runtime(1:end-1))), ...
                          mean(diff(complex_1025px_0p5s_0p00_q.runtime(1:end-1))), ...
                          mean(diff(complex_2047px_0p5s_0p00_q.runtime(1:end-1))), ...
                          mean(diff(complex_2049px_0p5s_0p00_q.runtime(1:end-1))), ...
                          mean(diff(complex_4095px_0p5s_0p00_q.runtime(1:end-1)))];
runtime_to_burnthrough = [max(complex_257px_0p5s_0p00_q.runtime), ...
                          max(complex_513px_0p5s_0p00_q.runtime), ...
                          max(complex_1025px_0p5s_0p00_q.runtime), ...
                          max(complex_2049px_0p5s_0p00_q.runtime), ...
                          max(complex_4095px_0p5s_0p00_q.runtime)];

%semilogy(resolutions, runtime_per_iteration, 'DisplayName', 'dt=0.5s, Th=0.00, Quartered');
loglog(resolutions, runtime_to_burnthrough, 'DisplayName', 'dt=0.5s, Th=0.00, Quartered');

lh = legend('show');
set(lh,'Location','Northwest');
grid on
xlabel('Resolution (pixels per side)')
ylabel('Runtime until burn-through (s)');
title('Comparison of runtimes for different parameters')
