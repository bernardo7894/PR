Z0 = 50;
l = 0.2;
ZG = 50;
er = 2;
v = physconst('LightSpeed') / sqrt(er);
f = [10e3:1e6:2e9+1e6];

%%% dados

% alínea i, linha sem perdas, curto-circuito
[real_i_A_CC, imag_i_A_CC] = impedancia_de_entrada(f, 0, Z0, 0, v, l);

% alínea i, linha sem perdas, circuito aberto
[real_i_A_CA, imag_i_A_CA] = impedancia_de_entrada(f, Inf, Z0, 0, v, l);

% alínea i, linha com perdas, curto-circuito
[real_i_B_CC, imag_i_B_CC] = impedancia_de_entrada(f, 0, Z0, 1e-5*f, v, l);

% alínea i, linha com perdas, circuito aberto
[real_i_B_CA, imag_i_B_CA] = impedancia_de_entrada(f, Inf, Z0, 0, v, l);



% alínea ii, linha sem perdas, curto-circuito
[modulo_ii_A_CC, fase_ii_A_CC] = coeficiente_de_reflexao(f, 0, Z0, 0, v, l);

% alínea ii, linha sem perdas, circuito aberto
[modulo_ii_A_CA, fase_ii_A_CA] = coeficiente_de_reflexao(f, Inf, Z0, 0, v, l);

% alínea ii, linha com perdas, curto-circuito
[modulo_ii_B_CC, fase_ii_B_CC] = coeficiente_de_reflexao(f, 0, Z0, 1e-5*f, v, l);

% alínea ii, linha com perdas, circuito aberto
[modulo_ii_B_CA, fase_ii_B_CA] = coeficiente_de_reflexao(f, Inf, Z0, 0, v, l);
 

    
% alínea iii não gera dados novos; está contida na parte dos gráficos



%%% gráficos
close all

figure('Name','Alínea i','NumberTitle','Off');
subplot(2,2,1), plot(f, real_i_A_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imaginária"), ...
    title("Z_{in} em função da frequência, CC e sem perdas"), xlim([min(f) max(f)]);
subplot(2,2,2), plot(f, real_i_A_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imaginária"), ...
    title("Z_{in} em função da frequência, CA e sem perdas"), xlim([min(f) max(f)]);
subplot(2,2,3), plot(f, real_i_B_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imaginária"), ...
    title("Z_{in} em função da frequência, CC e com perdas"), xlim([min(f) max(f)]);
subplot(2,2,4), plot(f, real_i_B_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imaginária"), ...
    title("Z_{in} em função da frequência, CA e com perdas"), xlim([min(f) max(f)]);

figure('Name','Alínea ii','NumberTitle','Off');
subplot(2,2,1), plot(f, modulo_ii_A_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_A_CC, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Módulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em função da frequência, CC e sem perdas");
subplot(2,2,2), plot(f, modulo_ii_A_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_A_CA, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Módulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em função da frequência, CA e sem perdas");
subplot(2,2,3), plot(f, modulo_ii_B_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_B_CC, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Módulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em função da frequência, CC e com perdas");
subplot(2,2,4), plot(f, modulo_ii_B_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_B_CA, 'LineWidth', 2), xlabel("Frequência [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Módulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em função da frequência, CA e com perdas");

figure('Name','Alínea iii','NumberTitle','Off');
subplot(2,2,1), polar(fase_ii_A_CC), title("\rho_L com CC e sem perdas");
subplot(2,2,2), polar(fase_ii_A_CA), title("\rho_L com CA e sem perdas");
subplot(2,2,3), polar(fase_ii_B_CC), title("\rho_L com CC e com perdas");
subplot(2,2,4), polar(fase_ii_B_CA), title("\rho_L com CA e com perdas");



