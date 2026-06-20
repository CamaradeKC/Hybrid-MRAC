zeta = 1;
wn = 5;

Am = [0 1; -wn^2 -2*zeta*wn];
Bm = [0; wn^2];
Cm = [1 0; 0 1];
Dm = [0;0];

Iy = 5; %kg.m^2
thrust = 6000; %6000 % N
max_thrust = 6000;
static_margin = 1; % m
mass = 15; % kg
lenght = 2; % m 

initial_position = 500; % m
initial_velocity = -100; % m/s
initial_teta = 0; %°
initial_rotation_speed = 0; % °/s
initial_teta = deg2rad(initial_teta);

A = [0 1; 0 0];
B = [0; -thrust*static_margin/Iy];
C = [1 0; 0 1];
D = [0;0];

Xm = [initial_teta; initial_rotation_speed];
gain=[500 2300]; %2300
Kx = ((Am-A)/B.').' ;
Kr = wn^2/(-thrust*static_margin/Iy) ;
sigma = 0;

engine_gimbal_speed = 50;% deg/s
engine_gimbal_speed = deg2rad(engine_gimbal_speed);

engine_max_angle = 3; % deg
engine_max_angle = deg2rad(engine_max_angle);

% __________________________________ thrust part ___________________________

g = 9.81; %m/s²
kp_t = 10;
kd_t = 30;