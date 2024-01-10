x1 = 4*ones(1, 200); 
f2 = 0.25; 
t2 = linspace(0, 1, 100); 
phase = 90; 
phase_in_rad = deg2rad(phase); 
x2 = sin((2*pi*f2*t2)+phase_in_rad)+3; 
x3 = 3*ones(1, 200); 
x = [x1 x2 x3]; 
t = linspace(-2, 3, 500); 
plot(t, x); 
ylim([0 6]);