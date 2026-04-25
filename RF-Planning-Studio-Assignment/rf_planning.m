clc;
clear;
close all;

%% -------------------------
% Baseline link parameters
%% -------------------------
c = 3e8;
f = 868e6; % Hz
lambda = c/f;
D = 4000; % m

Ptx = 14; % dBm
Gtx = 2; Grx = 2;
Lcable = 1;

Srx = -120; % sensitivity
fadeMargin = 10;

htx = 20; hrx = 2;
n = 2.7;

xObs = 0.5*D;
hObsAboveLOS = 3;
clearRatio = 0.60;

%% -------------------------
% Helper formulas
%% -------------------------
FSPL = @(fHz, d) (20*log10(fHz) + 20*log10(d) - 147.55);
PLlog = @(PL0, d, d0, n) (PL0 + 10*n*log10(d./d0));
EIRP = @(Ptx, Gtx, Lc) (Ptx + Gtx - Lc);
PrxFun = @(EIRP, Grx, PL, m) (EIRP + Grx - PL - m);
FresnelR = @(lambda, x, D) sqrt((lambda .* x .* (D-x)) ./ D);

%% Distance sweep
d = logspace(log10(200), log10(12000), 300);
dkm = d/1000;
d0 = 100;
PL0 = FSPL(f, d0);

PL = PLlog(PL0, d, d0, n);
Prx = PrxFun(EIRP(Ptx,Gtx,Lcable), Grx, PL, fadeMargin);

%% Fresnel baseline
rF = FresnelR(lambda, xObs, D);
requiredClear = clearRatio * rF;
fresnelOK = (hObsAboveLOS < requiredClear);

%% Plot
figure;
semilogx(dkm, Prx, 'LineWidth', 2); grid on; hold on;
yline(Srx, '--', 'Sensitivity');

xlabel('Distance (km)');
ylabel('Received Power (dBm)');
title('RF Planning Analysis');

%% -------- Experiment 1 --------
htx_1 = htx + 5;
maxLOS = 3.57*(sqrt(htx) + sqrt(hrx));
maxLOS_1 = 3.57*(sqrt(htx_1) + sqrt(hrx));

fprintf('Baseline LOS: %.2f km\n', maxLOS);
fprintf('Height+5m LOS: %.2f km\n', maxLOS_1);

%% -------- Experiment 2 --------
Gtx_2 = 5; Grx_2 = 5;
Prx_2 = PrxFun(EIRP(Ptx,Gtx_2,Lcable), Grx_2, PL, fadeMargin);
semilogx(dkm, Prx_2, 'LineWidth', 2);

%% -------- Experiment 3 --------
n_values = [2.0, 3.5, 4.0];

for i = 1:length(n_values)
    n_3 = n_values(i);
    PL_3 = PLlog(PL0, d, d0, n_3);
    Prx_3 = PrxFun(EIRP(Ptx,Gtx,Lcable), Grx, PL_3, fadeMargin);
    semilogx(dkm, Prx_3, 'LineWidth', 2);
end

%% -------- Experiment 4 --------
x_values = [0.1, 0.3, 0.5, 0.9];

for i = 1:length(x_values)
    xObs_4 = x_values(i)*D;
    rF_4 = FresnelR(lambda, xObs_4, D);
    requiredClear_4 = clearRatio * rF_4;
    
    fprintf('Obstacle at %.0f%% -> Fresnel radius = %.2f m\n', ...
        x_values(i)*100, rF_4);
end

legend('Baseline','Sensitivity','Gain=5dBi','n=2.0','n=3.5','n=4.0');

%% Save result
saveas(gcf,'results.png');

disp('Done. results.png saved.');
