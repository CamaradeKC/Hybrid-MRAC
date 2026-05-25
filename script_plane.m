%environment specs
rho=1.225;

%plane specs F16-like
mass=12000;% kg
Iy = 70000;% kg/m²
S=27.87; % m²
c = 3.45; %m
speed=180;% m/s

delta_max=deg2rad(25);
wing_cm_change_angle=deg2rad(15);
rate_of_change=15;

Cm_alpha=0.12;
Cm_alpha_stall=0.25;
Cm_alpha_deep_stall=-0.8;

Cm_delta=-4.5;
Cm_delta_stall=-2;
Cm_delta_deep_stall=-0.5;

Cm_q=-8;

initial_alpha=deg2rad(0);

pitch_value=deg2rad(5);

K=1/2 *rho * S *speed *speed*c;
desired_aoa = deg2rad(20);
max_command_allowed = deg2rad(40);

%MRAC spec
zeta = 0.7;
wn = 6;

Am = [0 1; -wn^2 -2*zeta*wn];
Bm = [0; wn^2];
Cm = [1 0; 0 1];
Dm = [0;0];

A=[0 1; Cm_alpha/Iy Cm_q/Iy];
B=[0; Cm_delta/Iy];
C = [1 0; 0 1];
D = [0;0];

Q = eye(2);
P = lyap(Am',Q);
gain_x =5*10^5; 
gain_r =5*10^5; 
gain_e =5*10^5; 
Kx = [0.52 0.08];
Kr = -0.35;
W = [0 0 0 0];
sigma_x=0.0003;
sigma_r=0.0003;
sigma_w=0.0003;