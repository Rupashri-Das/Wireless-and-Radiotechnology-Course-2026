clc;
close all;
clear all;

% ---- INPUT SECTION ----
tmin = input('The lower bound of theta in degree= ');
tmax = input('The upper bound of theta in degree= ');
pmin = input('The lower bound of phi in degree= ');
pmax = input('The upper bound of phi in degree= ');

% ---- FIXED INCREMENTS AND RADIAN CONVERSION FACTOR ----
tinc = 2;           % theta step size in degrees
pinc = 4;           % phi step size in degrees
rad  = pi/180;      % conversion factor: degrees to radians

% ---- BUILD ANGLE ARRAYS ----
theta1 = (tmin:tinc:tmax);      % theta in degrees
phi1   = (pmin:pinc:pmax);      % phi in degrees
theta  = theta1 .* rad;          % theta in radians
phi    = phi1   .* rad;          % phi in radians

% ---- CREATE 2D GRID ----
[THETA, PHI] = meshgrid(theta, phi);

% ---- PATTERN INPUTS ----
% User types: 1
y1 = input('The field pattern: E(THETA,PHI)= ');

% User types: 1  (stored as string for display)
v  = input('The field pattern: P(THETA,PHI)= ', 's');

% ---- COMPUTE PATTERN ----
y     = abs(y1);          % take absolute value of field pattern
ratio = max(max(y));      % find maximum value (used for normalization reference)

% ---- CONVERT SPHERICAL TO CARTESIAN FOR 3D PLOT ----
% sph2cart(azimuth, elevation, radius) converts to (X, Y, Z)
[X, Y, Z] = sph2cart(THETA, PHI, y);

% ---- PLOT ----
mesh(X, Y, Z);
title('3 D Pattern', 'Color', 'b', 'FontName', 'Helvetica', ...
      'FontSize', 12, 'FontWeight', 'demi');

% ---- PRINT INPUT PARAMETERS ----
fprintf('\n Input Parameters: \n--------------------');
fprintf('\n Theta = %2.0f', tmin);
fprintf(' : %2.0f', tinc);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi   = %2.0f', pmin);
fprintf(' : %2.0f', pinc);
fprintf(' : %2.0f', pmax);
fprintf('\n FIELD PATTERN : %s', v);

% ---- PRINT OUTPUT MESSAGE ----
fprintf('\n \n Output is shown in the figure below-----------');
fprintf('\n');
