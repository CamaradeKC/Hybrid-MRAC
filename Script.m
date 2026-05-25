zeta = 1;
wn = 5;

Am = [0 1; -wn^2 -2*zeta*wn];
Bm = [0; wn^2];
Cm = [1 0; 0 1];
Dm = [0;0];

Iy = 5; %kg.m^2
thrust = 6000; % N
static_margin = 1; % m

A = [0 1; 0 0];
B = [0; -thrust*static_margin/Iy];
C = [1 0; 0 1];
D = [0;0];

Q = eye(2);
P = lyap(Am',Q);


gain =1%1;%[500 2300]; %2300

Kx = ((Am-A)/B.').' ;
Kr = wn^2/(-thrust*static_margin/Iy); 
sigma = 0.00;

engine_gimbal_speed = 100;% deg/s
engine_gimbal_speed = deg2rad(engine_gimbal_speed);

engine_max_angle = 3; % deg
engine_max_angle = deg2rad(engine_max_angle);


max_thrust = 6000;
g = 9.81; %m/s²
kp_t = 10;
kd_t = 30;

kp = 0.0204;
kd = 0.00816;
mass = 15; % kg

initial_position = 500; % m
initial_velocity = -100; % m/s
initial_teta = -20; %°
initial_rotation_speed = 0; % °/s
initial_teta = deg2rad(initial_teta);
Xm = [initial_teta; initial_rotation_speed];
initial_velocity_x = sin(initial_teta)*initial_velocity;
initial_velocity_y = cos(initial_teta)*initial_velocity;

figure(1)
x = squeeze(out.x.Data);
z = squeeze(out.z.Data);
plot(x,z)
axis equal
grid on

figure(3)
x = squeeze(out.x.Data);
z = squeeze(out.z.Data);
plot(x,z)
grid on

figure(2)
plot(out.teta)





