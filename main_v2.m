
% for MRAC => MIMO 
%input : thrust, and angle
%output : state
%state : flight path angle, alpha, speed and q rate
%B matrix will be 2 column wide as there is a vector input now


%environment specs
rho=1.225;

%plane specs F16-like
mass=9000;% kg
Iy = 160000;% kg/m²
S=30; % m²
c = 3.2; %m
speed=180;% m/s

Cm_0=-0.8;

Cm_delta=-0.5;

rate_of_change=4; %Cm_delta and cm_0

Cm_q=-12;

initial_alpha=deg2rad(0);

K=1/2 *rho * S *c;

thrust = 160000;%N
g=9.81;%m/s²

%Lift part
kl=3;
Cl_alpha=5.7;
Cl0=0.1;

%Drag part
Cd0=0.02;
k_d1=0.045;
k_d2=0.08;

%MRAC spec
zeta_alpha = 0.7;
zeta_gamma = 1;
walpha = 6;
wgamma = 1;

Am = [0 1 0 0; -walpha^2 -2*zeta_alpha*walpha 0 0; 0 0 0 1; 0 0 -wgamma^2 -2*zeta_gamma*wgamma]
Bm = [0; walpha^2; 0; 0]
Cm = eye(size(Am));
Dm = zeros(4, 1);

B=[0; Cm_delta/Iy; 0; 0];

Q = eye(size(Am));
P = lyap(Am',Q);
gain_x =200; 
gain_r =300; 
gain_e =0;%5*10^5; 
Kx = [0 0 0 0];
Kr = 0;
W = [0 0 0 0];
sigma_x=0.0003;
sigma_r=0.0003;
sigma_w=0.0003;
rate_of_freeze_angle = 0.8;
rate_of_freeze_rate = 2;

desired_aoa = deg2rad(45);
max_command_allowed = deg2rad(30);
delta_max = deg2rad(25);