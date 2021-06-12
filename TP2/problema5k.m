P_emissao = 10;

% lambda com dielétrico epsilon_r = 2.25
lambda = 0.02;

d_antena = 20;

At_dBkm = 1.82;

At_dB = At_dBkm * d_antena;

At = 10^(At_dB/10);

P_in = P_emissao / At;

d_ligacao = 1e3:1e3:1000e3;

G_T = 1e3;

G_R = 1e3;

P_R = P_in * G_T * G_R * (lambda ./ (4*pi*d_ligacao)).^2;

P_R_total = P_R / At;

figure;
semilogy(d_ligacao, P_R_total, 'LineWidth', 2), xlabel("Distância de ligação [m]"), ...
    title("Potência recebida total em função da distância de ligação"), ...
    ylabel("Potência recebida total [W]"), xlim([d_ligacao(1) d_ligacao(end)]), grid on;

