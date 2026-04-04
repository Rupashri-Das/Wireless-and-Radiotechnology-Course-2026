clc;
close all;
clear all;

% ---- INPUT SECTION ----
tmin = input('The lower bound of theta in degree= ');
tmax = input('The upper bound of theta in degree= ');
pmin = input('The lower bound of phi in degree= ');
pmax = input('The upper bound of phi in degree= ');

% ---- CONVERT TO RADIANS AND BUILD GRIDS ----
theta = (tmin:tmax) * pi/180;   % theta array in radians
phi   = (pmin:pmax) * pi/180;   % phi array in radians
dth   = theta(2) - theta(1);    % step size in theta
dph   = phi(2)   - phi(1);      % step size in phi

[THETA, PHI] = meshgrid(theta, phi);  % 2D grid of angles

% ---- PATTERN INPUTS ----
x = input('The field pattern : E(THETA,PHI)= ', 's');   % user types: cos(THETA)
v = input('The power pattern: P(THETA,PHI)= ', 's');    % user types: cos(THETA).^2

% ---- EVALUATE FIELD PATTERN ----
% x is a string like 'cos(THETA)', eval() turns it into numbers
x = eval(x);   % now x is the actual matrix of E-field values

% ---- COMPUTE BEAM SOLID ANGLE ----
% Pn(theta,phi) = |E|^2 = x.^2
% Omega_A = sum( Pn * sin(theta) * dth * dph )
Prad = sum(sum( (x.^2) .* sin(THETA) * dth * dph ));

% ---- PRINT INPUT PARAMETERS ----
fprintf('\n Input Parameters: \n--------------------');
fprintf('\n Theta = %2.0f', tmin);
fprintf(' : %2.0f', dth*180/pi);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi   = %2.0f', pmin);
fprintf(' : %2.0f', dph*180/pi);
fprintf(' : %2.0f', pmax);
fprintf('\n POWER PATTERN : %s', v);

% ---- PRINT OUTPUT ----
fprintf('\n \n Output Parameters: \n--------------------');
fprintf('\n BEAM AREA (steradians) = %3.2f\n', Prad);
