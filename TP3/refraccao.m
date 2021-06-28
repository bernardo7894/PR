close all;

syms lambda n

n = (0.06961663*lambda^2)/(lambda^2-(0.0684043)^2);
n = n + (0.4079426*lambda^2)/(lambda^2 - 0.1162414^2);
n = n + (0.8974794*lambda^2)/(lambda^2-9.896161^2);
n = n + 1;
n = sqrt(n);

Dm = -lambda / physconst('lightspeed') * diff(n, lambda, 2);

% figure;
% fplot(n, 'LineWidth', 2), grid on;
% xlim([0.15 7.6]), ylim([0.5 1.5]);
% title('Índice de refracção em SiO_2 em função do comprimento de onda');
% xlabel('Comprimento de onda [µm]'), ylabel('Índice de refracção');

figure;
fplot(Dm, 'LineWidth', 2), grid on;
xlim([0.6 1.6]), ylim([-2.3e-10 1e-10]);
title('Dispersão material de SiO_2 em função do comprimento de onda');
xlabel('Comprimento de onda [µm]'), ylabel('Dispersão Material');