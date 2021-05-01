Z0 = 50;
l = 0.2;
ZG = 50;
er = 2;
v = physconst('LightSpeed') / sqrt(er);
f = [10e3:1e6:2e9+1e6];

%%% dados

% al�nea i, linha sem perdas, curto-circuito
[real_i_A_CC, imag_i_A_CC] = impedancia_de_entrada(f, 0, Z0, 0, v, l);

% al�nea i, linha sem perdas, circuito aberto
[real_i_A_CA, imag_i_A_CA] = impedancia_de_entrada(f, Inf, Z0, 0, v, l);

% al�nea i, linha com perdas, curto-circuito
[real_i_B_CC, imag_i_B_CC] = impedancia_de_entrada(f, 0, Z0, 1e-5*f, v, l);

% al�nea i, linha com perdas, circuito aberto
[real_i_B_CA, imag_i_B_CA] = impedancia_de_entrada(f, Inf, Z0, 0, v, l);



% al�nea ii, linha sem perdas, curto-circuito
[modulo_ii_A_CC, fase_ii_A_CC] = coeficiente_de_reflexao(f, 0, Z0, 0, v, l);

% al�nea ii, linha sem perdas, circuito aberto
[modulo_ii_A_CA, fase_ii_A_CA] = coeficiente_de_reflexao(f, Inf, Z0, 0, v, l);

% al�nea ii, linha com perdas, curto-circuito
[modulo_ii_B_CC, fase_ii_B_CC] = coeficiente_de_reflexao(f, 0, Z0, 1e-5*f, v, l);

% al�nea ii, linha com perdas, circuito aberto
[modulo_ii_B_CA, fase_ii_B_CA] = coeficiente_de_reflexao(f, Inf, Z0, 0, v, l);
 

    
% al�nea iii n�o gera dados novos; est� contida na parte dos gr�ficos



%%% gr�ficos
close all

figure('Name','Al�nea i','NumberTitle','Off');
subplot(2,2,1), plot(f, real_i_A_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imagin�ria"), ...
    title("Z_{in} em fun��o da frequ�ncia, CC e sem perdas"), xlim([min(f) max(f)]);
subplot(2,2,2), plot(f, real_i_A_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imagin�ria"), ...
    title("Z_{in} em fun��o da frequ�ncia, CA e sem perdas"), xlim([min(f) max(f)]);
subplot(2,2,3), plot(f, real_i_B_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imagin�ria"), ...
    title("Z_{in} em fun��o da frequ�ncia, CC e com perdas"), xlim([min(f) max(f)]);
subplot(2,2,4), plot(f, real_i_B_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, imag_i_A_CC, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("Parte real", "Parte imagin�ria"), ...
    title("Z_{in} em fun��o da frequ�ncia, CA e com perdas"), xlim([min(f) max(f)]);

figure('Name','Al�nea ii','NumberTitle','Off');
subplot(2,2,1), plot(f, modulo_ii_A_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_A_CC, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("M�dulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em fun��o da frequ�ncia, CC e sem perdas");
subplot(2,2,2), plot(f, modulo_ii_A_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_A_CA, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("M�dulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em fun��o da frequ�ncia, CA e sem perdas");
subplot(2,2,3), plot(f, modulo_ii_B_CC, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_B_CC, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("M�dulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em fun��o da frequ�ncia, CC e com perdas");
subplot(2,2,4), plot(f, modulo_ii_B_CA, 'LineWidth', 2), hold on, grid on, ...
    plot(f, fase_ii_B_CA, 'LineWidth', 2), xlabel("Frequ�ncia [Hz]"), ...
    ylabel("Z_{in} [?]"), legend("M�dulo", "Fase"), xlim([min(f) max(f)]), ...
    title("\rho_L em fun��o da frequ�ncia, CA e com perdas");

figure('Name','Al�nea iii','NumberTitle','Off');
subplot(2,2,1), polar(fase_ii_A_CC), title("\rho_L com CC e sem perdas");
subplot(2,2,2), polar(fase_ii_A_CA), title("\rho_L com CA e sem perdas");
subplot(2,2,3), polar(fase_ii_B_CC), title("\rho_L com CC e com perdas");
subplot(2,2,4), polar(fase_ii_B_CA), title("\rho_L com CA e com perdas");



